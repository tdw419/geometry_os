; DESCRIPTION: Places a purple line segment connecting (154, 116) to (225, 171).
; PLAN: r0=154(x1), r1=116(y1), r2=225(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 116
LDI r2, 225
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
