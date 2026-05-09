; DESCRIPTION: Draws a yellow line from (380, 28) to (428, 6).
; PLAN: r0=380(x1), r1=28(y1), r2=428(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 28
LDI r2, 428
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
