; DESCRIPTION: Composite: Places a cyan 50x71 rectangle at position (420, 81) then Creates a black circular shape at (81, 65) with radius 57.
; PLAN: r0=420(x), r1=81(y), r2=50(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=65(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 420
LDI r1, 81
LDI r2, 50
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 65
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
