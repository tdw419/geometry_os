; DESCRIPTION: Places a red line segment connecting (385, 215) to (160, 183).
; PLAN: r0=385(x1), r1=215(y1), r2=160(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 215
LDI r2, 160
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
