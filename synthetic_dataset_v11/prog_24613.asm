; DESCRIPTION: Draws a purple line from (209, 116) to (42, 16).
; PLAN: r0=209(x1), r1=116(y1), r2=42(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 116
LDI r2, 42
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
