; DESCRIPTION: Places a cyan line segment connecting (217, 152) to (117, 211).
; PLAN: r0=217(x1), r1=152(y1), r2=117(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 152
LDI r2, 117
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
