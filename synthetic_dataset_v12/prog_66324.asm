; DESCRIPTION: Places a red line segment connecting (481, 94) to (309, 173).
; PLAN: r0=481(x1), r1=94(y1), r2=309(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 94
LDI r2, 309
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
