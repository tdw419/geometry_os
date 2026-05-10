; DESCRIPTION: Draws a blue line from (264, 32) to (239, 94).
; PLAN: r0=264(x1), r1=32(y1), r2=239(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 32
LDI r2, 239
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
