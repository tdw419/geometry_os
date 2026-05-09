; DESCRIPTION: Renders a green box of size 21x96 starting at (361, 106).
; PLAN: r0=361(x), r1=106(y), r2=21(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 106
LDI r2, 21
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
