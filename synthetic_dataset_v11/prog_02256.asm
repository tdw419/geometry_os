; DESCRIPTION: Draws a red line from (36, 44) to (207, 192).
; PLAN: r0=36(x1), r1=44(y1), r2=207(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 44
LDI r2, 207
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
