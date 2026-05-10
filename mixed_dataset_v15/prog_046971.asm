; DESCRIPTION: Renders a white line between points (95, 128) and (452, 70).
; PLAN: r0=95(x1), r1=128(y1), r2=452(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 128
LDI r2, 452
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
