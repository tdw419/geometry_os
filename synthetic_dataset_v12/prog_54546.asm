; DESCRIPTION: Draws a magenta line from (126, 163) to (385, 239).
; PLAN: r0=126(x1), r1=163(y1), r2=385(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 163
LDI r2, 385
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
