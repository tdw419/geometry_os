; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (93, 147) with radius 71. Then Places a white 64x39 rectangle at position (54, 97).
; PLAN: r0=93(x), r1=147(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=54(x), r1=97(y), r2=64(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (93, 147) with radius 71.
; PLAN: r0=93(x), r1=147(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 147
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white 64x39 rectangle at position (54, 97).
; PLAN: r0=54(x), r1=97(y), r2=64(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 97
LDI r2, 64
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
