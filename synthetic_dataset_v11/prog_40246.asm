; DESCRIPTION: Renders a blue line between points (91, 42) and (28, 40).
; PLAN: r0=91(x1), r1=42(y1), r2=28(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 42
LDI r2, 28
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
