; DESCRIPTION: Places a magenta line segment connecting (210, 51) to (434, 50).
; PLAN: r0=210(x1), r1=51(y1), r2=434(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 51
LDI r2, 434
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
