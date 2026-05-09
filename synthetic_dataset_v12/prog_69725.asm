; DESCRIPTION: Draws a yellow line from (127, 183) to (298, 118).
; PLAN: r0=127(x1), r1=183(y1), r2=298(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 183
LDI r2, 298
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
