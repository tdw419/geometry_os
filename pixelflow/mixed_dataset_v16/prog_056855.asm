; DESCRIPTION: Places a white line segment connecting (253, 5) to (502, 178).
; PLAN: r0=253(x1), r1=5(y1), r2=502(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 5
LDI r2, 502
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
