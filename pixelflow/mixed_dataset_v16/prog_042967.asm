; DESCRIPTION: Composite: Places a white circle of radius 50 at center (291, 204) then Places a magenta dot at position (227, 53) then Creates a magenta rectangular region at (304, 40) spanning 11 by 58 pixels.
; PLAN: r0=291(x), r1=204(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=53(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=304(x), r11=40(y), r12=11(width), r13=58(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 204
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 53
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 304
LDI r11, 40
LDI r12, 11
LDI r13, 58
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
