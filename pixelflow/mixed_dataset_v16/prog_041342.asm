; DESCRIPTION: Renders a red line segment connecting (37, 32) to (215, 131).
; PLAN: r0=37(x1), r1=32(y1), r2=215(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 32
LDI r2, 215
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
