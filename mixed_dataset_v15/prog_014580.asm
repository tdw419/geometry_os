; DESCRIPTION: Renders a cyan line segment connecting (381, 35) to (115, 33).
; PLAN: r0=381(x1), r1=35(y1), r2=115(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 35
LDI r2, 115
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
