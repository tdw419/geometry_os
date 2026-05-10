; DESCRIPTION: Composite: Renders a purple disk with center (416, 103) and radius 53 then Creates a yellow rectangular region at (215, 129) spanning 52 by 120 pixels.
; PLAN: r0=416(x), r1=103(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=129(y), r7=52(width), r8=120(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 103
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 129
LDI r7, 52
LDI r8, 120
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
