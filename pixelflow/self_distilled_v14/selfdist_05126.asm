; DESCRIPTION: Renders a cyan line segment connecting (353, 22) to (213, 101).
; PLAN: r0=353(x1), r1=22(y1), r2=213(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 22
LDI r2, 213
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
