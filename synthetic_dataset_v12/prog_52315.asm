; DESCRIPTION: Composite: Places a red 38x19 rectangle at position (209, 77) then Places a blue circle of radius 79 at center (302, 139).
; PLAN: r0=209(x), r1=77(y), r2=38(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=139(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 209
LDI r1, 77
LDI r2, 38
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 139
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
