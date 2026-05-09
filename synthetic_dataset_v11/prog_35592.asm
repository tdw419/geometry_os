; DESCRIPTION: Places a black 33x20 rectangle at position (190, 75).
; PLAN: r0=190(x), r1=75(y), r2=33(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 75
LDI r2, 33
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
