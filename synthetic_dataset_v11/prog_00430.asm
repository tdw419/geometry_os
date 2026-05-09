; DESCRIPTION: Draws a purple line from (23, 173) to (184, 228).
; PLAN: r0=23(x1), r1=173(y1), r2=184(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 173
LDI r2, 184
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
