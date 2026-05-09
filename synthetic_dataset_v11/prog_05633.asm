; DESCRIPTION: Draws a yellow line from (228, 35) to (8, 170).
; PLAN: r0=228(x1), r1=35(y1), r2=8(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 35
LDI r2, 8
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
