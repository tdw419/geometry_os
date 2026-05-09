; DESCRIPTION: Places a white line segment connecting (91, 146) to (71, 128).
; PLAN: r0=91(x1), r1=146(y1), r2=71(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 146
LDI r2, 71
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
