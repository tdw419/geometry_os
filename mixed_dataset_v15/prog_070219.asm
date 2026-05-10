; DESCRIPTION: Draws a blue line from (257, 103) to (173, 208).
; PLAN: r0=257(x1), r1=103(y1), r2=173(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 103
LDI r2, 173
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
