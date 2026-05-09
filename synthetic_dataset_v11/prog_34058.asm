; DESCRIPTION: Draws a yellow line from (156, 212) to (225, 242).
; PLAN: r0=156(x1), r1=212(y1), r2=225(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 212
LDI r2, 225
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
