; DESCRIPTION: Composite: Renders a orange disk with center (212, 103) and radius 58 then Places a black dot at position (200, 126) then Renders a red box of size 62x77 starting at (221, 81).
; PLAN: r0=212(x), r1=103(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x), r6=126(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=221(x), r11=81(y), r12=62(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 103
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 126
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 221
LDI r11, 81
LDI r12, 62
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
