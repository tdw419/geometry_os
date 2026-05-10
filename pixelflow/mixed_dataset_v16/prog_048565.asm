; DESCRIPTION: Composite: Places a white circle of radius 21 at center (337, 223) then Renders a red box of size 32x90 starting at (82, 158).
; PLAN: r0=337(x), r1=223(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=82(x), r6=158(y), r7=32(width), r8=90(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 223
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 82
LDI r6, 158
LDI r7, 32
LDI r8, 90
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
