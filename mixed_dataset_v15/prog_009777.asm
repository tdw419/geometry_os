; DESCRIPTION: Renders a blue line between points (154, 214) and (307, 165).
; PLAN: r0=154(x1), r1=214(y1), r2=307(x2), r3=165(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 214
LDI r2, 307
LDI r3, 165
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
