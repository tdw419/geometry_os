; DESCRIPTION: Places a red line segment connecting (181, 195) to (446, 84).
; PLAN: r0=181(x1), r1=195(y1), r2=446(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 195
LDI r2, 446
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
