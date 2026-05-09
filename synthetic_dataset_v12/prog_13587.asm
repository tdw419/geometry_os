; DESCRIPTION: Places a green line segment connecting (479, 31) to (328, 53).
; PLAN: r0=479(x1), r1=31(y1), r2=328(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 31
LDI r2, 328
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
