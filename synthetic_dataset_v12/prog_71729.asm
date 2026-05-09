; DESCRIPTION: Places a blue line segment connecting (51, 228) to (152, 197).
; PLAN: r0=51(x1), r1=228(y1), r2=152(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 228
LDI r2, 152
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
