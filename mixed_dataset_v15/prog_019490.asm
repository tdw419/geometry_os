; DESCRIPTION: Renders a blue line between points (239, 181) and (450, 42).
; PLAN: r0=239(x1), r1=181(y1), r2=450(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 181
LDI r2, 450
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
