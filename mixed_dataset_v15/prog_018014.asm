; DESCRIPTION: Renders a cyan line between points (317, 252) and (154, 35).
; PLAN: r0=317(x1), r1=252(y1), r2=154(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 252
LDI r2, 154
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
