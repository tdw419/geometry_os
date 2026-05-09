; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (165, 175) with radius 31. Then Places a cyan 25x53 rectangle at position (194, 153).
; PLAN: r0=165(x), r1=175(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=194(x), r1=153(y), r2=25(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (165, 175) with radius 31.
; PLAN: r0=165(x), r1=175(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 175
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan 25x53 rectangle at position (194, 153).
; PLAN: r0=194(x), r1=153(y), r2=25(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 153
LDI r2, 25
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
