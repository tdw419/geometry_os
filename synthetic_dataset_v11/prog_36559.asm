; DESCRIPTION: Composite: . Then Places a black 48x50 rectangle at position (205, 168). Then Creates a purple circular shape at (178, 45) with radius 19.
; PLAN: r0=205(x), r1=168(y), r2=48(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x), r1=45(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black 48x50 rectangle at position (205, 168).
; PLAN: r0=205(x), r1=168(y), r2=48(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 168
LDI r2, 48
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (178, 45) with radius 19.
; PLAN: r0=178(x), r1=45(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 45
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
