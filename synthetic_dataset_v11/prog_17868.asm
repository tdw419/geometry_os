; DESCRIPTION: Composite: . Then Places a magenta circle of radius 34 at center (149, 91). Then Creates a red rectangular region at (116, 0) spanning 110 by 30 pixels.
; PLAN: r0=149(x), r1=91(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=116(x), r1=0(y), r2=110(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 34 at center (149, 91).
; PLAN: r0=149(x), r1=91(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 91
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (116, 0) spanning 110 by 30 pixels.
; PLAN: r0=116(x), r1=0(y), r2=110(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 0
LDI r2, 110
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
