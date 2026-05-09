; DESCRIPTION: Draws a magenta line from (103, 129) to (292, 218).
; PLAN: r0=103(x1), r1=129(y1), r2=292(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 129
LDI r2, 292
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
