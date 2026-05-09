; DESCRIPTION: Renders a cyan line between points (323, 70) and (416, 30).
; PLAN: r0=323(x1), r1=70(y1), r2=416(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 70
LDI r2, 416
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
