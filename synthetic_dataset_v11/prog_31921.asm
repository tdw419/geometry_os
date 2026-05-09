; DESCRIPTION: Composite: . Then Places a black line segment connecting (6, 99) to (135, 29). Then Places a white dot at position (80, 210).
; PLAN: r0=6(x1), r1=99(y1), r2=135(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=80(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (6, 99) to (135, 29).
; PLAN: r0=6(x1), r1=99(y1), r2=135(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 99
LDI r2, 135
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (80, 210).
; PLAN: r0=80(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 210
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
