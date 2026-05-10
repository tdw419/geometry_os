; DESCRIPTION: Places a red line segment connecting (392, 231) to (368, 74).
; PLAN: r0=392(x1), r1=231(y1), r2=368(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 231
LDI r2, 368
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
