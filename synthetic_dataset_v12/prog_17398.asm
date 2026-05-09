; DESCRIPTION: Draws a white line from (210, 13) to (68, 8).
; PLAN: r0=210(x1), r1=13(y1), r2=68(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 13
LDI r2, 68
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
