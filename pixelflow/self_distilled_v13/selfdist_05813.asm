; DESCRIPTION: Renders a cyan line segment connecting (11, 186) to (246, 71).
; PLAN: r0=11(x1), r1=186(y1), r2=246(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 186
LDI r2, 246
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
