; DESCRIPTION: Draws a magenta line from (255, 82) to (301, 237).
; PLAN: r0=255(x1), r1=82(y1), r2=301(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 82
LDI r2, 301
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
