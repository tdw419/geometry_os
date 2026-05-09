; DESCRIPTION: Draws a blue line from (210, 166) to (151, 228).
; PLAN: r0=210(x1), r1=166(y1), r2=151(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 166
LDI r2, 151
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
