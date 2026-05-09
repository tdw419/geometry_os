; DESCRIPTION: Draws a cyan line from (347, 109) to (290, 17).
; PLAN: r0=347(x1), r1=109(y1), r2=290(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 109
LDI r2, 290
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
