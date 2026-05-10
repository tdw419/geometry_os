; DESCRIPTION: Places a blue line segment connecting (403, 18) to (479, 203).
; PLAN: r0=403(x1), r1=18(y1), r2=479(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 18
LDI r2, 479
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
