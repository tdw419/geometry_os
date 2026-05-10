; DESCRIPTION: Renders a cyan line segment connecting (309, 33) to (10, 33).
; PLAN: r0=309(x1), r1=33(y1), r2=10(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 33
LDI r2, 10
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
