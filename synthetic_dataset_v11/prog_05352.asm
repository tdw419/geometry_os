; DESCRIPTION: Places a magenta line segment connecting (198, 13) to (16, 215).
; PLAN: r0=198(x1), r1=13(y1), r2=16(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 13
LDI r2, 16
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
