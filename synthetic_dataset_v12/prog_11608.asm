; DESCRIPTION: Places a cyan line segment connecting (58, 19) to (479, 165).
; PLAN: r0=58(x1), r1=19(y1), r2=479(x2), r3=165(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 19
LDI r2, 479
LDI r3, 165
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
