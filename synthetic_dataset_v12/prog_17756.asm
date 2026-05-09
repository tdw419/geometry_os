; DESCRIPTION: Composite: Places a red 45x45 rectangle at position (240, 155) then Renders a cyan disk with center (383, 181) and radius 54.
; PLAN: r0=240(x), r1=155(y), r2=45(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=181(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 155
LDI r2, 45
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 181
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
