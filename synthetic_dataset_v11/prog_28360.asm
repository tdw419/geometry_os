; DESCRIPTION: Renders a green box of size 18x26 starting at (45, 4).
; PLAN: r0=45(x), r1=4(y), r2=18(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 4
LDI r2, 18
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
