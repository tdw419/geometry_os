; DESCRIPTION: Places a blue line segment connecting (12, 61) to (42, 29).
; PLAN: r0=12(x1), r1=61(y1), r2=42(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 61
LDI r2, 42
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
