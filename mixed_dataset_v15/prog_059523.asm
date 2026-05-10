; DESCRIPTION: Renders a blue line between points (328, 42) and (492, 98).
; PLAN: r0=328(x1), r1=42(y1), r2=492(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 42
LDI r2, 492
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
