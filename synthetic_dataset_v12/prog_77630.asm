; DESCRIPTION: Draws a blue line from (463, 39) to (298, 243).
; PLAN: r0=463(x1), r1=39(y1), r2=298(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 39
LDI r2, 298
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
