; DESCRIPTION: Places a red line segment connecting (28, 210) to (126, 222).
; PLAN: r0=28(x1), r1=210(y1), r2=126(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 210
LDI r2, 126
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
