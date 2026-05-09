; DESCRIPTION: Draws a green line from (59, 10) to (36, 243).
; PLAN: r0=59(x1), r1=10(y1), r2=36(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 10
LDI r2, 36
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
