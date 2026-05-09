; DESCRIPTION: Places a blue line segment connecting (241, 197) to (307, 221).
; PLAN: r0=241(x1), r1=197(y1), r2=307(x2), r3=221(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 197
LDI r2, 307
LDI r3, 221
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
