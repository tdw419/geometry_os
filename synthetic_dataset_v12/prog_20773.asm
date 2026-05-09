; DESCRIPTION: Places a black line segment connecting (392, 226) to (291, 253).
; PLAN: r0=392(x1), r1=226(y1), r2=291(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 226
LDI r2, 291
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
