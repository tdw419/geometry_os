; DESCRIPTION: Renders a purple box of size 24x68 starting at (174, 105).
; PLAN: r0=174(x), r1=105(y), r2=24(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 105
LDI r2, 24
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
