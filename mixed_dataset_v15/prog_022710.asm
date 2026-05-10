; DESCRIPTION: Draws a green line from (147, 180) to (460, 236).
; PLAN: r0=147(x1), r1=180(y1), r2=460(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 180
LDI r2, 460
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
