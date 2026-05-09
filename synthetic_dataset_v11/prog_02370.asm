; DESCRIPTION: Composite: . Then Creates a black rectangular region at (160, 162) spanning 54 by 92 pixels. Then Draws a white circle centered at (169, 171) with radius 50.
; PLAN: r0=160(x), r1=162(y), r2=54(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=169(x), r1=171(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (160, 162) spanning 54 by 92 pixels.
; PLAN: r0=160(x), r1=162(y), r2=54(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 162
LDI r2, 54
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (169, 171) with radius 50.
; PLAN: r0=169(x), r1=171(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 171
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
