; DESCRIPTION: Draws a magenta line from (253, 29) to (263, 125).
; PLAN: r0=253(x1), r1=29(y1), r2=263(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 29
LDI r2, 263
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
