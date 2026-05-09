; DESCRIPTION: Places a blue line segment connecting (178, 178) to (479, 166).
; PLAN: r0=178(x1), r1=178(y1), r2=479(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 178
LDI r2, 479
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
