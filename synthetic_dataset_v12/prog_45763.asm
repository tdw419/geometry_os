; DESCRIPTION: Composite: Places a orange 61x40 rectangle at position (280, 33) then Renders a orange disk with center (77, 64) and radius 11.
; PLAN: r0=280(x), r1=33(y), r2=61(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=64(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 33
LDI r2, 61
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 64
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
