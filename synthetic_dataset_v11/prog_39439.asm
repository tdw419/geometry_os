; DESCRIPTION: Places a green line segment connecting (64, 27) to (75, 65).
; PLAN: r0=64(x1), r1=27(y1), r2=75(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 27
LDI r2, 75
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
