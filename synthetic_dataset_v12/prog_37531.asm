; DESCRIPTION: Places a orange line segment connecting (271, 63) to (327, 228).
; PLAN: r0=271(x1), r1=63(y1), r2=327(x2), r3=228(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 63
LDI r2, 327
LDI r3, 228
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
