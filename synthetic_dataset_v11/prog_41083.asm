; DESCRIPTION: Draws a cyan line from (30, 152) to (65, 147).
; PLAN: r0=30(x1), r1=152(y1), r2=65(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 152
LDI r2, 65
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
