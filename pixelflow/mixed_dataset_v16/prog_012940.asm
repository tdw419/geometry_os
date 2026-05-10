; DESCRIPTION: Draws a yellow line from (32, 148) to (221, 215).
; PLAN: r0=32(x1), r1=148(y1), r2=221(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 148
LDI r2, 221
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
