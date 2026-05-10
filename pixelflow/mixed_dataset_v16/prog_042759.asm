; DESCRIPTION: Renders a blue line segment connecting (262, 162) to (154, 148).
; PLAN: r0=262(x1), r1=162(y1), r2=154(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 162
LDI r2, 154
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
