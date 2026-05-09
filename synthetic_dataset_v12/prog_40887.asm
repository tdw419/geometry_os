; DESCRIPTION: Places a black 18x15 rectangle at position (190, 215).
; PLAN: r0=190(x), r1=215(y), r2=18(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 215
LDI r2, 18
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
