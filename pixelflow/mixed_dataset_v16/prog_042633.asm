; DESCRIPTION: Renders a white line segment connecting (174, 59) to (231, 107).
; PLAN: r0=174(x1), r1=59(y1), r2=231(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 59
LDI r2, 231
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
