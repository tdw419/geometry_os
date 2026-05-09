; DESCRIPTION: Places a orange line segment connecting (187, 230) to (197, 57).
; PLAN: r0=187(x1), r1=230(y1), r2=197(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 230
LDI r2, 197
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
