; DESCRIPTION: Places a green line segment connecting (263, 161) to (111, 228).
; PLAN: r0=263(x1), r1=161(y1), r2=111(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 161
LDI r2, 111
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
