; DESCRIPTION: Composite: Renders a green line between points (183, 237) and (239, 108) then Places a blue 26x62 rectangle at position (360, 93).
; PLAN: r0=183(x1), r1=237(y1), r2=239(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=360(x), r6=93(y), r7=26(width), r8=62(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 183
LDI r1, 237
LDI r2, 239
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 93
LDI r7, 26
LDI r8, 62
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
