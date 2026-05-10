; DESCRIPTION: Draws a yellow line from (211, 146) to (174, 28).
; PLAN: r0=211(x1), r1=146(y1), r2=174(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 146
LDI r2, 174
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
