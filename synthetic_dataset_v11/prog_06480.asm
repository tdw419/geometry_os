; DESCRIPTION: Composite: . Then Renders a purple disk with center (115, 111) and radius 58. Then Creates a cyan rectangular region at (6, 71) spanning 112 by 69 pixels.
; PLAN: r0=115(x), r1=111(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=6(x), r1=71(y), r2=112(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (115, 111) and radius 58.
; PLAN: r0=115(x), r1=111(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 111
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a cyan rectangular region at (6, 71) spanning 112 by 69 pixels.
; PLAN: r0=6(x), r1=71(y), r2=112(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 71
LDI r2, 112
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
