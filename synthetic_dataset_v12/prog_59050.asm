; DESCRIPTION: Renders a cyan line between points (50, 122) and (9, 79).
; PLAN: r0=50(x1), r1=122(y1), r2=9(x2), r3=79(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 122
LDI r2, 9
LDI r3, 79
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
