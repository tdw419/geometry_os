; DESCRIPTION: Composite: . Then Places a red 49x91 rectangle at position (112, 72). Then Creates a cyan circular shape at (32, 105) with radius 14.
; PLAN: r0=112(x), r1=72(y), r2=49(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=32(x), r1=105(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 49x91 rectangle at position (112, 72).
; PLAN: r0=112(x), r1=72(y), r2=49(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 72
LDI r2, 49
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (32, 105) with radius 14.
; PLAN: r0=32(x), r1=105(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 105
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
