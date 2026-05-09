; DESCRIPTION: Draws a black line from (114, 16) to (294, 206).
; PLAN: r0=114(x1), r1=16(y1), r2=294(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 16
LDI r2, 294
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
