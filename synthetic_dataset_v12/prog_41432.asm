; DESCRIPTION: Places a magenta line segment connecting (406, 67) to (494, 209).
; PLAN: r0=406(x1), r1=67(y1), r2=494(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 67
LDI r2, 494
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
