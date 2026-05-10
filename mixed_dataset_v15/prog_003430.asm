; DESCRIPTION: Places a black line segment connecting (94, 29) to (410, 210).
; PLAN: r0=94(x1), r1=29(y1), r2=410(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 29
LDI r2, 410
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
