; DESCRIPTION: Draws a green line from (271, 233) to (127, 168).
; PLAN: r0=271(x1), r1=233(y1), r2=127(x2), r3=168(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 233
LDI r2, 127
LDI r3, 168
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
