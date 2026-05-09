; DESCRIPTION: Composite: . Then Creates a red rectangular region at (112, 65) spanning 71 by 106 pixels. Then Places a green circle of radius 45 at center (183, 98).
; PLAN: r0=112(x), r1=65(y), r2=71(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=183(x), r1=98(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a red rectangular region at (112, 65) spanning 71 by 106 pixels.
; PLAN: r0=112(x), r1=65(y), r2=71(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 65
LDI r2, 71
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 45 at center (183, 98).
; PLAN: r0=183(x), r1=98(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 98
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
