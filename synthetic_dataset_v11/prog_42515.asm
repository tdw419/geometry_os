; DESCRIPTION: Renders a purple box of size 115x33 starting at (119, 174).
; PLAN: r0=119(x), r1=174(y), r2=115(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 174
LDI r2, 115
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
