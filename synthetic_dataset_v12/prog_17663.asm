; DESCRIPTION: Renders a cyan line between points (320, 158) and (80, 41).
; PLAN: r0=320(x1), r1=158(y1), r2=80(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 158
LDI r2, 80
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
