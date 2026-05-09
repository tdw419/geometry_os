; DESCRIPTION: Places a red line segment connecting (362, 47) to (210, 98).
; PLAN: r0=362(x1), r1=47(y1), r2=210(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 47
LDI r2, 210
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
