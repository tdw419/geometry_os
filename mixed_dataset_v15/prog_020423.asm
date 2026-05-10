; DESCRIPTION: Places a red line segment connecting (191, 202) to (70, 103).
; PLAN: r0=191(x1), r1=202(y1), r2=70(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 202
LDI r2, 70
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
