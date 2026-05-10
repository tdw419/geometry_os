; DESCRIPTION: Renders a cyan line segment connecting (22, 69) to (309, 66).
; PLAN: r0=22(x1), r1=69(y1), r2=309(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 69
LDI r2, 309
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
