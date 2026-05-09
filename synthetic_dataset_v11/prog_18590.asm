; DESCRIPTION: Composite: . Then Places a yellow circle of radius 58 at center (116, 189). Then Creates a orange rectangular region at (188, 71) spanning 67 by 51 pixels.
; PLAN: r0=116(x), r1=189(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x), r1=71(y), r2=67(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 58 at center (116, 189).
; PLAN: r0=116(x), r1=189(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 189
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (188, 71) spanning 67 by 51 pixels.
; PLAN: r0=188(x), r1=71(y), r2=67(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 71
LDI r2, 67
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
