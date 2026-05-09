; DESCRIPTION: Places a magenta line segment connecting (82, 135) to (257, 164).
; PLAN: r0=82(x1), r1=135(y1), r2=257(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 135
LDI r2, 257
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
