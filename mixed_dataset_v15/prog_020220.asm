; DESCRIPTION: Renders a cyan line segment connecting (364, 52) to (247, 33).
; PLAN: r0=364(x1), r1=52(y1), r2=247(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 52
LDI r2, 247
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
