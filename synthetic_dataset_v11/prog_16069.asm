; DESCRIPTION: Places a black line segment connecting (193, 100) to (186, 228).
; PLAN: r0=193(x1), r1=100(y1), r2=186(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 100
LDI r2, 186
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
