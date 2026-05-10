; DESCRIPTION: Draws a magenta line from (285, 52) to (346, 195).
; PLAN: r0=285(x1), r1=52(y1), r2=346(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 52
LDI r2, 346
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
