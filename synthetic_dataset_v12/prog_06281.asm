; DESCRIPTION: Places a magenta line segment connecting (121, 210) to (104, 246).
; PLAN: r0=121(x1), r1=210(y1), r2=104(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 210
LDI r2, 104
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
