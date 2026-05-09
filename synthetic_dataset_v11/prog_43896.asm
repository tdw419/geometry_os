; DESCRIPTION: Composite: . Then Places a red circle of radius 21 at center (137, 199). Then Places a green 99x60 rectangle at position (12, 50).
; PLAN: r0=137(x), r1=199(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=50(y), r2=99(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 21 at center (137, 199).
; PLAN: r0=137(x), r1=199(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 199
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green 99x60 rectangle at position (12, 50).
; PLAN: r0=12(x), r1=50(y), r2=99(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 50
LDI r2, 99
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
