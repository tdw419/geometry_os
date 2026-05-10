; DESCRIPTION: Composite: Renders a magenta disk with center (348, 100) and radius 80 then Places a white 99x61 rectangle at position (239, 186).
; PLAN: r0=348(x), r1=100(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=186(y), r7=99(width), r8=61(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 348
LDI r1, 100
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 186
LDI r7, 99
LDI r8, 61
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
