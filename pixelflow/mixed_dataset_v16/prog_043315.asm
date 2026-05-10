; DESCRIPTION: Places a magenta line segment connecting (465, 94) to (327, 215).
; PLAN: r0=465(x1), r1=94(y1), r2=327(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 94
LDI r2, 327
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
