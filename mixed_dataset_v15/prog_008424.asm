; DESCRIPTION: Places a magenta line segment connecting (199, 151) to (286, 86).
; PLAN: r0=199(x1), r1=151(y1), r2=286(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 151
LDI r2, 286
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
