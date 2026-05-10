; DESCRIPTION: Renders a cyan line segment connecting (244, 70) to (226, 127).
; PLAN: r0=244(x1), r1=70(y1), r2=226(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 70
LDI r2, 226
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
