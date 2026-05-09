; DESCRIPTION: Places a white line segment connecting (228, 165) to (172, 193).
; PLAN: r0=228(x1), r1=165(y1), r2=172(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 165
LDI r2, 172
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
