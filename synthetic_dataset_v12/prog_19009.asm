; DESCRIPTION: Draws a magenta line from (397, 242) to (75, 251).
; PLAN: r0=397(x1), r1=242(y1), r2=75(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 242
LDI r2, 75
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
