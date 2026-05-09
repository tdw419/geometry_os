; DESCRIPTION: Places a magenta line segment connecting (383, 228) to (506, 24).
; PLAN: r0=383(x1), r1=228(y1), r2=506(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 228
LDI r2, 506
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
