; DESCRIPTION: Places a white line segment connecting (206, 65) to (434, 92).
; PLAN: r0=206(x1), r1=65(y1), r2=434(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 65
LDI r2, 434
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
