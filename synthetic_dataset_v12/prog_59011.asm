; DESCRIPTION: Draws a yellow line from (415, 254) to (124, 16).
; PLAN: r0=415(x1), r1=254(y1), r2=124(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 254
LDI r2, 124
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
