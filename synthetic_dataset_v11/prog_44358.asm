; DESCRIPTION: Composite: . Then Creates a red rectangular region at (86, 64) spanning 93 by 45 pixels. Then Creates a cyan circular shape at (81, 81) with radius 26.
; PLAN: r0=86(x), r1=64(y), r2=93(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x), r1=81(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (86, 64) spanning 93 by 45 pixels.
; PLAN: r0=86(x), r1=64(y), r2=93(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 64
LDI r2, 93
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (81, 81) with radius 26.
; PLAN: r0=81(x), r1=81(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 81
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
