; DESCRIPTION: Draws a yellow line from (57, 39) to (442, 182).
; PLAN: r0=57(x1), r1=39(y1), r2=442(x2), r3=182(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 39
LDI r2, 442
LDI r3, 182
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
