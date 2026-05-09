; DESCRIPTION: Renders a cyan line between points (310, 115) and (132, 120).
; PLAN: r0=310(x1), r1=115(y1), r2=132(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 115
LDI r2, 132
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
