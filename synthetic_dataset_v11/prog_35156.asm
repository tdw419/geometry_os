; DESCRIPTION: Places a purple line segment connecting (117, 173) to (95, 146).
; PLAN: r0=117(x1), r1=173(y1), r2=95(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 173
LDI r2, 95
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
