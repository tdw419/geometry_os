; DESCRIPTION: Places a green line segment connecting (415, 178) to (327, 33).
; PLAN: r0=415(x1), r1=178(y1), r2=327(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 178
LDI r2, 327
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
