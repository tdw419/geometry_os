; DESCRIPTION: Composite: Places a purple circle of radius 40 at center (158, 96) then Places a green 59x34 rectangle at position (164, 0).
; PLAN: r0=158(x), r1=96(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=0(y), r7=59(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 96
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 0
LDI r7, 59
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
