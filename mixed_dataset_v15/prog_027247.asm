; DESCRIPTION: Draws a purple line from (16, 42) to (415, 220).
; PLAN: r0=16(x1), r1=42(y1), r2=415(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 42
LDI r2, 415
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
