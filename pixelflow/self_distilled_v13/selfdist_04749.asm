; DESCRIPTION: Draws a green line from (364, 152) to (75, 12).
; PLAN: r0=364(x1), r1=152(y1), r2=75(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 152
LDI r2, 75
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
