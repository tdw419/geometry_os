; DESCRIPTION: Places a white line segment connecting (259, 253) to (398, 178).
; PLAN: r0=259(x1), r1=253(y1), r2=398(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 253
LDI r2, 398
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
