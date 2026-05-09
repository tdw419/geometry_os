; DESCRIPTION: Composite: Creates a white circular shape at (154, 83) with radius 42 then Renders a orange box of size 94x38 starting at (201, 39) then Sets a single orange pixel at (303, 241).
; PLAN: r0=154(x), r1=83(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=39(y), r7=94(width), r8=38(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=303(x), r11=241(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 154
LDI r1, 83
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 39
LDI r7, 94
LDI r8, 38
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 241
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
