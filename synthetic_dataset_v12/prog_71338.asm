; DESCRIPTION: Draws a white line from (67, 196) to (220, 169).
; PLAN: r0=67(x1), r1=196(y1), r2=220(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 196
LDI r2, 220
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
