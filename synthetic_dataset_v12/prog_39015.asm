; DESCRIPTION: Places a magenta line segment connecting (479, 36) to (326, 139).
; PLAN: r0=479(x1), r1=36(y1), r2=326(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 36
LDI r2, 326
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
