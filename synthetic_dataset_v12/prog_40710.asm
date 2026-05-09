; DESCRIPTION: Draws a blue line from (480, 113) to (394, 154).
; PLAN: r0=480(x1), r1=113(y1), r2=394(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 113
LDI r2, 394
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
