; DESCRIPTION: Places a magenta line segment connecting (32, 82) to (356, 226).
; PLAN: r0=32(x1), r1=82(y1), r2=356(x2), r3=226(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 82
LDI r2, 356
LDI r3, 226
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
