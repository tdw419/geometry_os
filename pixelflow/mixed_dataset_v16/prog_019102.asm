; DESCRIPTION: Renders a magenta line between points (371, 143) and (28, 231).
; PLAN: r0=371(x1), r1=143(y1), r2=28(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 143
LDI r2, 28
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
