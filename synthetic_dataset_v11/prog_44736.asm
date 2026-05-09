; DESCRIPTION: Draws a white line from (243, 196) to (62, 176).
; PLAN: r0=243(x1), r1=196(y1), r2=62(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 196
LDI r2, 62
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
