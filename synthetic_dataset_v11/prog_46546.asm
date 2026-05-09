; DESCRIPTION: Places a blue line segment connecting (42, 154) to (114, 52).
; PLAN: r0=42(x1), r1=154(y1), r2=114(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 154
LDI r2, 114
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
