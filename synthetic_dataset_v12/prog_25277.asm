; DESCRIPTION: Composite: Creates a blue circular shape at (401, 103) with radius 57 then Places a purple dot at position (60, 103) then Renders a yellow box of size 85x98 starting at (1, 153).
; PLAN: r0=401(x), r1=103(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=103(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=1(x), r11=153(y), r12=85(width), r13=98(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 103
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 103
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 1
LDI r11, 153
LDI r12, 85
LDI r13, 98
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
