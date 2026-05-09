; DESCRIPTION: Places a white line segment connecting (65, 228) to (386, 217).
; PLAN: r0=65(x1), r1=228(y1), r2=386(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 228
LDI r2, 386
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
