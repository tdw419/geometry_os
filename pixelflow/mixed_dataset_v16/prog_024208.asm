; DESCRIPTION: Draws a yellow line from (212, 31) to (328, 242).
; PLAN: r0=212(x1), r1=31(y1), r2=328(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 31
LDI r2, 328
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
