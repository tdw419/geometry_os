; DESCRIPTION: Composite: . Then Places a white 119x39 rectangle at position (110, 44). Then Places a black line segment connecting (176, 207) to (53, 65).
; PLAN: r0=110(x), r1=44(y), r2=119(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x1), r1=207(y1), r2=53(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white 119x39 rectangle at position (110, 44).
; PLAN: r0=110(x), r1=44(y), r2=119(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 44
LDI r2, 119
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (176, 207) to (53, 65).
; PLAN: r0=176(x1), r1=207(y1), r2=53(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 207
LDI r2, 53
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
