; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (123, 173) spanning 92 by 33 pixels. Then Renders a blue disk with center (67, 193) and radius 57.
; PLAN: r0=123(x), r1=173(y), r2=92(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=67(x), r1=193(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a orange rectangular region at (123, 173) spanning 92 by 33 pixels.
; PLAN: r0=123(x), r1=173(y), r2=92(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 173
LDI r2, 92
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue disk with center (67, 193) and radius 57.
; PLAN: r0=67(x), r1=193(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 193
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
