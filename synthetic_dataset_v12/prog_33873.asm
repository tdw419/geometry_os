; DESCRIPTION: Places a green line segment connecting (290, 19) to (460, 202).
; PLAN: r0=290(x1), r1=19(y1), r2=460(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 19
LDI r2, 460
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
