; DESCRIPTION: Places a cyan line segment connecting (381, 152) to (57, 233).
; PLAN: r0=381(x1), r1=152(y1), r2=57(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 152
LDI r2, 57
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
