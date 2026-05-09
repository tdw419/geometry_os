; DESCRIPTION: Places a white line segment connecting (145, 233) to (198, 213).
; PLAN: r0=145(x1), r1=233(y1), r2=198(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 233
LDI r2, 198
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
