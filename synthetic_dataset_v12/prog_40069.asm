; DESCRIPTION: Renders a cyan line between points (463, 252) and (36, 95).
; PLAN: r0=463(x1), r1=252(y1), r2=36(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 252
LDI r2, 36
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
