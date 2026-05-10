; DESCRIPTION: Draws a purple line from (295, 113) to (210, 107).
; PLAN: r0=295(x1), r1=113(y1), r2=210(x2), r3=107(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 113
LDI r2, 210
LDI r3, 107
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
