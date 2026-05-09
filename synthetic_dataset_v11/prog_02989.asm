; DESCRIPTION: Places a red line segment connecting (90, 249) to (215, 2).
; PLAN: r0=90(x1), r1=249(y1), r2=215(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 249
LDI r2, 215
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
