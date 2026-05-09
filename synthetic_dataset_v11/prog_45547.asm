; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (106, 32) spanning 108 by 116 pixels. Then Places a yellow circle of radius 39 at center (209, 204).
; PLAN: r0=106(x), r1=32(y), r2=108(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=209(x), r1=204(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a yellow rectangular region at (106, 32) spanning 108 by 116 pixels.
; PLAN: r0=106(x), r1=32(y), r2=108(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 32
LDI r2, 108
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 39 at center (209, 204).
; PLAN: r0=209(x), r1=204(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 204
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
