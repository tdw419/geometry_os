; DESCRIPTION: Renders a cyan line between points (347, 79) and (290, 142).
; PLAN: r0=347(x1), r1=79(y1), r2=290(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 79
LDI r2, 290
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
