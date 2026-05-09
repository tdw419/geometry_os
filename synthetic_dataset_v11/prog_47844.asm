; DESCRIPTION: Draws a cyan line from (21, 147) to (166, 252).
; PLAN: r0=21(x1), r1=147(y1), r2=166(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 147
LDI r2, 166
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
