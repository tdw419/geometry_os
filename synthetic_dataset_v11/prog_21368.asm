; DESCRIPTION: Composite: . Then Places a black line segment connecting (152, 46) to (94, 146). Then Creates a white circular shape at (149, 87) with radius 29.
; PLAN: r0=152(x1), r1=46(y1), r2=94(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=87(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (152, 46) to (94, 146).
; PLAN: r0=152(x1), r1=46(y1), r2=94(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 46
LDI r2, 94
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (149, 87) with radius 29.
; PLAN: r0=149(x), r1=87(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 87
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
