; DESCRIPTION: Places a black line segment connecting (264, 107) to (464, 167).
; PLAN: r0=264(x1), r1=107(y1), r2=464(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 107
LDI r2, 464
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
