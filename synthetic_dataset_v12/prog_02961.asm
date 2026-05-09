; DESCRIPTION: Composite: Renders a orange box of size 39x23 starting at (278, 87) then Places a black circle of radius 24 at center (389, 79).
; PLAN: r0=278(x), r1=87(y), r2=39(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=79(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 87
LDI r2, 39
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 79
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
