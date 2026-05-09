; DESCRIPTION: Places a green line segment connecting (197, 14) to (146, 0).
; PLAN: r0=197(x1), r1=14(y1), r2=146(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 14
LDI r2, 146
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
