; DESCRIPTION: Draws a cyan line from (431, 173) to (147, 204).
; PLAN: r0=431(x1), r1=173(y1), r2=147(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 173
LDI r2, 147
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
