; DESCRIPTION: Draws a yellow line from (372, 146) to (28, 221).
; PLAN: r0=372(x1), r1=146(y1), r2=28(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 146
LDI r2, 28
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
