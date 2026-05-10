; DESCRIPTION: Renders a cyan line segment connecting (132, 158) to (281, 171).
; PLAN: r0=132(x1), r1=158(y1), r2=281(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 158
LDI r2, 281
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
