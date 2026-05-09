; DESCRIPTION: Renders a orange line between points (26, 152) and (220, 236).
; PLAN: r0=26(x1), r1=152(y1), r2=220(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 152
LDI r2, 220
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
