; DESCRIPTION: Draws a yellow line from (446, 90) to (71, 131).
; PLAN: r0=446(x1), r1=90(y1), r2=71(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 90
LDI r2, 71
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
