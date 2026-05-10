; DESCRIPTION: Places a cyan line segment connecting (114, 166) to (481, 105).
; PLAN: r0=114(x1), r1=166(y1), r2=481(x2), r3=105(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 166
LDI r2, 481
LDI r3, 105
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
