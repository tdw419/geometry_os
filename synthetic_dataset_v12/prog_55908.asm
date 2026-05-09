; DESCRIPTION: Places a green line segment connecting (362, 62) to (386, 14).
; PLAN: r0=362(x1), r1=62(y1), r2=386(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 62
LDI r2, 386
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
