; DESCRIPTION: Renders a cyan line segment connecting (247, 24) to (246, 200).
; PLAN: r0=247(x1), r1=24(y1), r2=246(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 24
LDI r2, 246
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
