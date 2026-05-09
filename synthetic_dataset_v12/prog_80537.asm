; DESCRIPTION: Draws a yellow line from (36, 147) to (242, 95).
; PLAN: r0=36(x1), r1=147(y1), r2=242(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 147
LDI r2, 242
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
