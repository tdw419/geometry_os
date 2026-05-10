; DESCRIPTION: Draws a magenta line from (176, 209) to (271, 249).
; PLAN: r0=176(x1), r1=209(y1), r2=271(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 209
LDI r2, 271
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
