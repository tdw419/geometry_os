; DESCRIPTION: Places a white line segment connecting (481, 16) to (465, 159).
; PLAN: r0=481(x1), r1=16(y1), r2=465(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 16
LDI r2, 465
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
