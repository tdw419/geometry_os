; DESCRIPTION: Composite: . Then Creates a green circular shape at (133, 168) with radius 42. Then Places a purple 24x45 rectangle at position (129, 56).
; PLAN: r0=133(x), r1=168(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=129(x), r1=56(y), r2=24(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (133, 168) with radius 42.
; PLAN: r0=133(x), r1=168(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 168
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple 24x45 rectangle at position (129, 56).
; PLAN: r0=129(x), r1=56(y), r2=24(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 56
LDI r2, 24
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
