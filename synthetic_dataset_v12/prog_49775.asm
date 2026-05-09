; DESCRIPTION: Renders a yellow line between points (206, 97) and (196, 173).
; PLAN: r0=206(x1), r1=97(y1), r2=196(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 97
LDI r2, 196
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
