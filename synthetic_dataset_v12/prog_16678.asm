; DESCRIPTION: Draws a blue line from (283, 236) to (385, 228).
; PLAN: r0=283(x1), r1=236(y1), r2=385(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 236
LDI r2, 385
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
