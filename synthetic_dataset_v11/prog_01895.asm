; DESCRIPTION: Composite: . Then Places a white circle of radius 23 at center (73, 211). Then Renders a black line between points (231, 69) and (187, 244).
; PLAN: r0=73(x), r1=211(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=231(x1), r1=69(y1), r2=187(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 23 at center (73, 211).
; PLAN: r0=73(x), r1=211(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 211
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a black line between points (231, 69) and (187, 244).
; PLAN: r0=231(x1), r1=69(y1), r2=187(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 69
LDI r2, 187
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
