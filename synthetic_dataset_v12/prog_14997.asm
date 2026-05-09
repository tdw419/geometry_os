; DESCRIPTION: Renders a cyan line between points (248, 56) and (146, 252).
; PLAN: r0=248(x1), r1=56(y1), r2=146(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 56
LDI r2, 146
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
