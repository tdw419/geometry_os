; DESCRIPTION: Places a magenta line segment connecting (173, 35) to (199, 127).
; PLAN: r0=173(x1), r1=35(y1), r2=199(x2), r3=127(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 35
LDI r2, 199
LDI r3, 127
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
