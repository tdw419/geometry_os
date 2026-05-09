; DESCRIPTION: Draws a magenta line from (153, 59) to (18, 223).
; PLAN: r0=153(x1), r1=59(y1), r2=18(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 59
LDI r2, 18
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
