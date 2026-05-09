; DESCRIPTION: Draws a yellow line from (57, 38) to (146, 227).
; PLAN: r0=57(x1), r1=38(y1), r2=146(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 38
LDI r2, 146
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
