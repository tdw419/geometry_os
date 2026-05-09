; DESCRIPTION: Places a black line segment connecting (211, 249) to (228, 182).
; PLAN: r0=211(x1), r1=249(y1), r2=228(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 249
LDI r2, 228
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
