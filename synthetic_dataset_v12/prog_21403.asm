; DESCRIPTION: Places a yellow line segment connecting (26, 221) to (320, 6).
; PLAN: r0=26(x1), r1=221(y1), r2=320(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 221
LDI r2, 320
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
