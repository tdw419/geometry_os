; DESCRIPTION: Draws a magenta line from (373, 53) to (298, 214).
; PLAN: r0=373(x1), r1=53(y1), r2=298(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 53
LDI r2, 298
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
