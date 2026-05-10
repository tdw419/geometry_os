; DESCRIPTION: Places a magenta line segment connecting (460, 29) to (197, 34).
; PLAN: r0=460(x1), r1=29(y1), r2=197(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 29
LDI r2, 197
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
