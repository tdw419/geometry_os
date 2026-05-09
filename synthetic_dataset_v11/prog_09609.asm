; DESCRIPTION: Composite: . Then Renders a purple disk with center (68, 72) and radius 32. Then Creates a magenta rectangular region at (137, 70) spanning 82 by 65 pixels.
; PLAN: r0=68(x), r1=72(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=137(x), r1=70(y), r2=82(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (68, 72) and radius 32.
; PLAN: r0=68(x), r1=72(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 72
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (137, 70) spanning 82 by 65 pixels.
; PLAN: r0=137(x), r1=70(y), r2=82(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 70
LDI r2, 82
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
