; DESCRIPTION: Renders a cyan line segment connecting (241, 53) to (373, 52).
; PLAN: r0=241(x1), r1=53(y1), r2=373(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 53
LDI r2, 373
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
