; DESCRIPTION: Places a green line segment connecting (44, 63) to (218, 228).
; PLAN: r0=44(x1), r1=63(y1), r2=218(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 63
LDI r2, 218
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
