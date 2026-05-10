; DESCRIPTION: Composite: Places a magenta circle of radius 74 at center (90, 93) then Places a orange 62x97 rectangle at position (273, 58).
; PLAN: r0=90(x), r1=93(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=58(y), r7=62(width), r8=97(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 93
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 58
LDI r7, 62
LDI r8, 97
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
