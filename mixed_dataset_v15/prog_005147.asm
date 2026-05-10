; DESCRIPTION: Composite: Renders a purple disk with center (113, 131) and radius 72 then Places a purple dot at position (249, 92) then Renders a white box of size 24x100 starting at (177, 16).
; PLAN: r0=113(x), r1=131(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=92(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=16(y), r12=24(width), r13=100(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 113
LDI r1, 131
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 92
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 177
LDI r11, 16
LDI r12, 24
LDI r13, 100
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
