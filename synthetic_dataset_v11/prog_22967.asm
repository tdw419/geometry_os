; DESCRIPTION: Renders a white line between points (67, 175) and (178, 220).
; PLAN: r0=67(x1), r1=175(y1), r2=178(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 175
LDI r2, 178
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
