; DESCRIPTION: Draws a magenta line from (255, 15) to (42, 193).
; PLAN: r0=255(x1), r1=15(y1), r2=42(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 15
LDI r2, 42
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
