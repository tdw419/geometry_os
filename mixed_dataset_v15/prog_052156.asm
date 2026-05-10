; DESCRIPTION: Composite: Renders a orange disk with center (193, 154) and radius 57 then Renders a black box of size 61x100 starting at (295, 126).
; PLAN: r0=193(x), r1=154(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=126(y), r7=61(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 154
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 126
LDI r7, 61
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
