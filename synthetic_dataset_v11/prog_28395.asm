; DESCRIPTION: Composite: . Then Creates a black rectangular region at (135, 12) spanning 117 by 59 pixels. Then Creates a orange circular shape at (180, 154) with radius 55.
; PLAN: r0=135(x), r1=12(y), r2=117(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=154(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (135, 12) spanning 117 by 59 pixels.
; PLAN: r0=135(x), r1=12(y), r2=117(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 12
LDI r2, 117
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (180, 154) with radius 55.
; PLAN: r0=180(x), r1=154(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 154
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
