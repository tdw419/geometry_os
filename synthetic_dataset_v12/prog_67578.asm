; DESCRIPTION: Places a magenta line segment connecting (171, 223) to (257, 231).
; PLAN: r0=171(x1), r1=223(y1), r2=257(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 223
LDI r2, 257
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
