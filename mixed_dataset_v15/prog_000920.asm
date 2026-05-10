; DESCRIPTION: Places a red line segment connecting (209, 216) to (309, 173).
; PLAN: r0=209(x1), r1=216(y1), r2=309(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 216
LDI r2, 309
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
