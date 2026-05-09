; DESCRIPTION: Draws a yellow line from (27, 25) to (29, 180).
; PLAN: r0=27(x1), r1=25(y1), r2=29(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 25
LDI r2, 29
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
