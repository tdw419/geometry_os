; DESCRIPTION: Draws a purple line from (405, 60) to (298, 21).
; PLAN: r0=405(x1), r1=60(y1), r2=298(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 60
LDI r2, 298
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
