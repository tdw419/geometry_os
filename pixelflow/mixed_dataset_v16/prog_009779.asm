; DESCRIPTION: Draws a yellow line from (50, 97) to (294, 54).
; PLAN: r0=50(x1), r1=97(y1), r2=294(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 97
LDI r2, 294
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
