; DESCRIPTION: Places a yellow line segment connecting (398, 63) to (347, 228).
; PLAN: r0=398(x1), r1=63(y1), r2=347(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 63
LDI r2, 347
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
