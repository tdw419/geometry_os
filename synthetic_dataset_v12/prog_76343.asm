; DESCRIPTION: Draws a green line from (28, 61) to (373, 243).
; PLAN: r0=28(x1), r1=61(y1), r2=373(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 61
LDI r2, 373
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
