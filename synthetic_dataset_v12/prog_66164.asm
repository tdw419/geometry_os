; DESCRIPTION: Composite: Places a blue 80x70 rectangle at position (391, 95) then Places a cyan circle of radius 55 at center (238, 150).
; PLAN: r0=391(x), r1=95(y), r2=80(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x), r6=150(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 95
LDI r2, 80
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 150
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
