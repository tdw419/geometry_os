; DESCRIPTION: Composite: . Then Places a white line segment connecting (153, 132) to (55, 152). Then Places a cyan circle of radius 26 at center (149, 174).
; PLAN: r0=153(x1), r1=132(y1), r2=55(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=149(x), r1=174(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (153, 132) to (55, 152).
; PLAN: r0=153(x1), r1=132(y1), r2=55(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 132
LDI r2, 55
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 26 at center (149, 174).
; PLAN: r0=149(x), r1=174(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 174
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
