; DESCRIPTION: Draws a blue line from (42, 235) to (127, 208).
; PLAN: r0=42(x1), r1=235(y1), r2=127(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 235
LDI r2, 127
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
