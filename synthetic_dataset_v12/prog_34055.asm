; DESCRIPTION: Places a purple line segment connecting (202, 167) to (362, 171).
; PLAN: r0=202(x1), r1=167(y1), r2=362(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 167
LDI r2, 362
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
