; DESCRIPTION: Draws a white line from (259, 44) to (412, 83).
; PLAN: r0=259(x1), r1=44(y1), r2=412(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 44
LDI r2, 412
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
