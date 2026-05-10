; DESCRIPTION: Places a black line segment connecting (362, 39) to (307, 26).
; PLAN: r0=362(x1), r1=39(y1), r2=307(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 39
LDI r2, 307
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
