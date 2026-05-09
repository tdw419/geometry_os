; DESCRIPTION: Draws a blue line from (136, 215) to (218, 57).
; PLAN: r0=136(x1), r1=215(y1), r2=218(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 215
LDI r2, 218
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
