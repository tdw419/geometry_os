; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (129, 162) spanning 88 by 82 pixels. Then Creates a green circular shape at (215, 152) with radius 18.
; PLAN: r0=129(x), r1=162(y), r2=88(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=215(x), r1=152(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (129, 162) spanning 88 by 82 pixels.
; PLAN: r0=129(x), r1=162(y), r2=88(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 162
LDI r2, 88
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (215, 152) with radius 18.
; PLAN: r0=215(x), r1=152(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 152
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
