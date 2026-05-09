; DESCRIPTION: Draws a purple line from (290, 125) to (239, 57).
; PLAN: r0=290(x1), r1=125(y1), r2=239(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 125
LDI r2, 239
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
