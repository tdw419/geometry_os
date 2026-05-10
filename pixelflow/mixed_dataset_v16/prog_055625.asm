; DESCRIPTION: Composite: Renders a green disk with center (196, 191) and radius 64 then Creates a white rectangular region at (400, 221) spanning 85 by 12 pixels.
; PLAN: r0=196(x), r1=191(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=221(y), r7=85(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 191
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 221
LDI r7, 85
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
