; DESCRIPTION: Draws a magenta line from (446, 50) to (346, 133).
; PLAN: r0=446(x1), r1=50(y1), r2=346(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 50
LDI r2, 346
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
