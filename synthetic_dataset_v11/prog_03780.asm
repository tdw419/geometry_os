; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (71, 120) with radius 32. Then Places a yellow 62x111 rectangle at position (139, 12).
; PLAN: r0=71(x), r1=120(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=139(x), r1=12(y), r2=62(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (71, 120) with radius 32.
; PLAN: r0=71(x), r1=120(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 120
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 62x111 rectangle at position (139, 12).
; PLAN: r0=139(x), r1=12(y), r2=62(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 12
LDI r2, 62
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
