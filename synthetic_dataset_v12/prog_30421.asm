; DESCRIPTION: Draws a yellow line from (263, 113) to (180, 209).
; PLAN: r0=263(x1), r1=113(y1), r2=180(x2), r3=209(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 113
LDI r2, 180
LDI r3, 209
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
