; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (184, 114) with radius 63. Then Places a yellow 82x106 rectangle at position (36, 2).
; PLAN: r0=184(x), r1=114(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=36(x), r1=2(y), r2=82(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (184, 114) with radius 63.
; PLAN: r0=184(x), r1=114(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 114
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 82x106 rectangle at position (36, 2).
; PLAN: r0=36(x), r1=2(y), r2=82(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 2
LDI r2, 82
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
