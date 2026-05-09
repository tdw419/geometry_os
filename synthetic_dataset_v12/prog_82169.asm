; DESCRIPTION: Renders a green box of size 110x19 starting at (260, 182).
; PLAN: r0=260(x), r1=182(y), r2=110(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 182
LDI r2, 110
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
