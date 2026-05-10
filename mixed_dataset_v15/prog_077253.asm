; DESCRIPTION: Draws a yellow line from (114, 255) to (259, 199).
; PLAN: r0=114(x1), r1=255(y1), r2=259(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 255
LDI r2, 259
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
