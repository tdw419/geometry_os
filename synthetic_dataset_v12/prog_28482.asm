; DESCRIPTION: Draws a magenta line from (435, 124) to (25, 32).
; PLAN: r0=435(x1), r1=124(y1), r2=25(x2), r3=32(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 124
LDI r2, 25
LDI r3, 32
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
