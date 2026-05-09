; DESCRIPTION: Draws a purple line from (346, 171) to (360, 153).
; PLAN: r0=346(x1), r1=171(y1), r2=360(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 171
LDI r2, 360
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
