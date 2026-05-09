; DESCRIPTION: Composite: Renders a cyan box of size 84x25 starting at (276, 209) then Places a white circle of radius 52 at center (54, 178).
; PLAN: r0=276(x), r1=209(y), r2=84(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=178(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 276
LDI r1, 209
LDI r2, 84
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 178
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
