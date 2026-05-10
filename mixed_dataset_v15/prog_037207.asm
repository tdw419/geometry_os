; DESCRIPTION: Renders a green line segment connecting (140, 132) to (392, 16).
; PLAN: r0=140(x1), r1=132(y1), r2=392(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 132
LDI r2, 392
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
