; DESCRIPTION: Draws a yellow line from (59, 36) to (187, 240).
; PLAN: r0=59(x1), r1=36(y1), r2=187(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 36
LDI r2, 187
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
