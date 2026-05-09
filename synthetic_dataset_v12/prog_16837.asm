; DESCRIPTION: Places a blue line segment connecting (171, 15) to (445, 103).
; PLAN: r0=171(x1), r1=15(y1), r2=445(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 15
LDI r2, 445
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
