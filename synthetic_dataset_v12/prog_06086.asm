; DESCRIPTION: Places a black 78x21 rectangle at position (175, 190).
; PLAN: r0=175(x), r1=190(y), r2=78(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 190
LDI r2, 78
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
