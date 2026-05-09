; DESCRIPTION: Places a red line segment connecting (293, 134) to (197, 151).
; PLAN: r0=293(x1), r1=134(y1), r2=197(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 134
LDI r2, 197
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
