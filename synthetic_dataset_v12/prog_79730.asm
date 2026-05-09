; DESCRIPTION: Draws a red line from (263, 62) to (209, 11).
; PLAN: r0=263(x1), r1=62(y1), r2=209(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 62
LDI r2, 209
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
