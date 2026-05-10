; DESCRIPTION: Renders a cyan line segment connecting (327, 158) to (244, 167).
; PLAN: r0=327(x1), r1=158(y1), r2=244(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 158
LDI r2, 244
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
