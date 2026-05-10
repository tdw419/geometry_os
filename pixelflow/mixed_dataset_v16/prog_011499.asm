; DESCRIPTION: Places a green line segment connecting (46, 138) to (285, 166).
; PLAN: r0=46(x1), r1=138(y1), r2=285(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 138
LDI r2, 285
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
