; DESCRIPTION: Places a black line segment connecting (225, 171) to (64, 174).
; PLAN: r0=225(x1), r1=171(y1), r2=64(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 171
LDI r2, 64
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
