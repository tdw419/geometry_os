; DESCRIPTION: Draws a red line from (57, 114) to (32, 13).
; PLAN: r0=57(x1), r1=114(y1), r2=32(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 114
LDI r2, 32
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
