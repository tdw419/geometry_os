; DESCRIPTION: Composite: . Then Places a white circle of radius 48 at center (87, 155). Then Creates a black rectangular region at (126, 97) spanning 33 by 111 pixels.
; PLAN: r0=87(x), r1=155(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x), r1=97(y), r2=33(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 48 at center (87, 155).
; PLAN: r0=87(x), r1=155(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 155
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a black rectangular region at (126, 97) spanning 33 by 111 pixels.
; PLAN: r0=126(x), r1=97(y), r2=33(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 97
LDI r2, 33
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
