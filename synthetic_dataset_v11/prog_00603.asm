; DESCRIPTION: Places a green line segment connecting (217, 7) to (220, 107).
; PLAN: r0=217(x1), r1=7(y1), r2=220(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 7
LDI r2, 220
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
