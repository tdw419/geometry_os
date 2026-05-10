; DESCRIPTION: Places a blue line segment connecting (504, 93) to (305, 93).
; PLAN: r0=504(x1), r1=93(y1), r2=305(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 93
LDI r2, 305
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
