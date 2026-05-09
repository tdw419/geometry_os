; DESCRIPTION: Draws a yellow line from (294, 169) to (395, 184).
; PLAN: r0=294(x1), r1=169(y1), r2=395(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 169
LDI r2, 395
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
