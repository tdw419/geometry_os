; DESCRIPTION: Draws a black line from (382, 195) to (420, 16).
; PLAN: r0=382(x1), r1=195(y1), r2=420(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 195
LDI r2, 420
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
