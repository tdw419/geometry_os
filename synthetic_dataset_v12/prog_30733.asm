; DESCRIPTION: Composite: Places a orange 96x116 rectangle at position (120, 16) then Renders a yellow disk with center (287, 148) and radius 53.
; PLAN: r0=120(x), r1=16(y), r2=96(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=287(x), r6=148(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 16
LDI r2, 96
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 148
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
