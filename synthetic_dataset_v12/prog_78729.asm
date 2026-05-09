; DESCRIPTION: Places a red line segment connecting (210, 197) to (480, 141).
; PLAN: r0=210(x1), r1=197(y1), r2=480(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 197
LDI r2, 480
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
