; DESCRIPTION: Places a green line segment connecting (123, 67) to (241, 27).
; PLAN: r0=123(x1), r1=67(y1), r2=241(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 67
LDI r2, 241
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
