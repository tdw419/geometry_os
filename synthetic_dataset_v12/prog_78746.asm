; DESCRIPTION: Places a magenta line segment connecting (443, 95) to (240, 8).
; PLAN: r0=443(x1), r1=95(y1), r2=240(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 95
LDI r2, 240
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
