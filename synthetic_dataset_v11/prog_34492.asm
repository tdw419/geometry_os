; DESCRIPTION: Draws a yellow line from (143, 44) to (105, 215).
; PLAN: r0=143(x1), r1=44(y1), r2=105(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 44
LDI r2, 105
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
