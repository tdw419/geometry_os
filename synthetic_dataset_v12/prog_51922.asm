; DESCRIPTION: Draws a blue line from (218, 139) to (42, 113).
; PLAN: r0=218(x1), r1=139(y1), r2=42(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 139
LDI r2, 42
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
