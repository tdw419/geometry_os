; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (119, 90) with radius 25. Then Creates a purple rectangular region at (36, 109) spanning 16 by 67 pixels.
; PLAN: r0=119(x), r1=90(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=36(x), r1=109(y), r2=16(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (119, 90) with radius 25.
; PLAN: r0=119(x), r1=90(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 90
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (36, 109) spanning 16 by 67 pixels.
; PLAN: r0=36(x), r1=109(y), r2=16(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 109
LDI r2, 16
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
