; DESCRIPTION: Renders a blue line between points (60, 153) and (42, 215).
; PLAN: r0=60(x1), r1=153(y1), r2=42(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 153
LDI r2, 42
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
