; DESCRIPTION: Composite: Renders a orange disk with center (377, 80) and radius 19 then Places a red 113x49 rectangle at position (102, 200) then Places a purple dot at position (400, 253).
; PLAN: r0=377(x), r1=80(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=102(x), r6=200(y), r7=113(width), r8=49(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=400(x), r11=253(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 80
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 102
LDI r6, 200
LDI r7, 113
LDI r8, 49
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 253
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
