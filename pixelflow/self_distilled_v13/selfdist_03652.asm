; DESCRIPTION: Renders a green line segment connecting (66, 16) to (57, 33).
; PLAN: r0=66(x1), r1=16(y1), r2=57(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 16
LDI r2, 57
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
