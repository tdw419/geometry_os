; DESCRIPTION: Draws a red line from (209, 32) to (113, 114).
; PLAN: r0=209(x1), r1=32(y1), r2=113(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 32
LDI r2, 113
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
