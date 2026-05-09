; DESCRIPTION: Composite: . Then Renders a black disk with center (189, 156) and radius 58. Then Creates a red rectangular region at (42, 60) spanning 95 by 68 pixels.
; PLAN: r0=189(x), r1=156(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=42(x), r1=60(y), r2=95(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (189, 156) and radius 58.
; PLAN: r0=189(x), r1=156(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 156
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a red rectangular region at (42, 60) spanning 95 by 68 pixels.
; PLAN: r0=42(x), r1=60(y), r2=95(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 60
LDI r2, 95
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
