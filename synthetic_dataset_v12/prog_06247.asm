; DESCRIPTION: Renders a white line between points (388, 67) and (370, 231).
; PLAN: r0=388(x1), r1=67(y1), r2=370(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 67
LDI r2, 370
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
