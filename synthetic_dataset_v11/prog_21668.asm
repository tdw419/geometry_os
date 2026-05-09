; DESCRIPTION: Places a white line segment connecting (234, 93) to (197, 144).
; PLAN: r0=234(x1), r1=93(y1), r2=197(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 93
LDI r2, 197
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
