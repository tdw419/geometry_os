; DESCRIPTION: Draws a magenta line from (48, 58) to (264, 61).
; PLAN: r0=48(x1), r1=58(y1), r2=264(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 58
LDI r2, 264
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
