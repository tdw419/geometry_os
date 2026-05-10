; DESCRIPTION: Places a white line segment connecting (450, 172) to (261, 215).
; PLAN: r0=450(x1), r1=172(y1), r2=261(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 172
LDI r2, 261
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
