; DESCRIPTION: Composite: Renders a red disk with center (354, 93) and radius 73 then Draws a red line from (271, 3) to (216, 73) then Places a purple 51x49 rectangle at position (458, 191).
; PLAN: r0=354(x), r1=93(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x1), r6=3(y1), r7=216(x2), r8=73(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=191(y), r12=51(width), r13=49(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 93
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 3
LDI r7, 216
LDI r8, 73
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 191
LDI r12, 51
LDI r13, 49
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
