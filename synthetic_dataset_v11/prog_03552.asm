; DESCRIPTION: Places a white line segment connecting (215, 66) to (9, 182).
; PLAN: r0=215(x1), r1=66(y1), r2=9(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 66
LDI r2, 9
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
