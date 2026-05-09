; DESCRIPTION: Draws a yellow line from (480, 111) to (436, 31).
; PLAN: r0=480(x1), r1=111(y1), r2=436(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 111
LDI r2, 436
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
