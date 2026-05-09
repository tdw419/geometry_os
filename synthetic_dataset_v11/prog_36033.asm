; DESCRIPTION: Places a magenta line segment connecting (79, 196) to (215, 53).
; PLAN: r0=79(x1), r1=196(y1), r2=215(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 196
LDI r2, 215
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
