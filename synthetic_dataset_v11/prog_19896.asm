; DESCRIPTION: Places a green line segment connecting (239, 26) to (251, 228).
; PLAN: r0=239(x1), r1=26(y1), r2=251(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 26
LDI r2, 251
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
