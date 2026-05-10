; DESCRIPTION: Renders a cyan line segment connecting (206, 172) to (252, 132).
; PLAN: r0=206(x1), r1=172(y1), r2=252(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 172
LDI r2, 252
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
