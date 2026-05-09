; DESCRIPTION: Composite: . Then Places a white line segment connecting (56, 26) to (62, 61). Then Draws a cyan circle centered at (115, 64) with radius 53.
; PLAN: r0=56(x1), r1=26(y1), r2=62(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=115(x), r1=64(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white line segment connecting (56, 26) to (62, 61).
; PLAN: r0=56(x1), r1=26(y1), r2=62(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 26
LDI r2, 62
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (115, 64) with radius 53.
; PLAN: r0=115(x), r1=64(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 64
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
