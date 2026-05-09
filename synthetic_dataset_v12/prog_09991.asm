; DESCRIPTION: Draws a cyan line from (451, 208) to (361, 222).
; PLAN: r0=451(x1), r1=208(y1), r2=361(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 208
LDI r2, 361
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
