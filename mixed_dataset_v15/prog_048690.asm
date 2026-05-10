; DESCRIPTION: Composite: Places a red dot at position (108, 131) then Renders a magenta disk with center (341, 120) and radius 55 then Renders a white box of size 28x72 starting at (416, 162).
; PLAN: r0=108(x), r1=131(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=120(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=416(x), r11=162(y), r12=28(width), r13=72(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 131
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 341
LDI r6, 120
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 416
LDI r11, 162
LDI r12, 28
LDI r13, 72
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
