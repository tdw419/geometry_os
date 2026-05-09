; DESCRIPTION: Draws a blue line from (168, 42) to (120, 163).
; PLAN: r0=168(x1), r1=42(y1), r2=120(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 42
LDI r2, 120
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
