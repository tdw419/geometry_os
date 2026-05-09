; DESCRIPTION: Draws a magenta line from (385, 209) to (239, 43).
; PLAN: r0=385(x1), r1=209(y1), r2=239(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 209
LDI r2, 239
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
