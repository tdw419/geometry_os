; DESCRIPTION: Draws a magenta line from (103, 33) to (59, 10).
; PLAN: r0=103(x1), r1=33(y1), r2=59(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 33
LDI r2, 59
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
