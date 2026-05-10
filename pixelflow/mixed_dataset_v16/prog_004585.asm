; DESCRIPTION: Composite: Renders a red disk with center (25, 14) and radius 10 then Places a orange 12x65 rectangle at position (442, 60) then Sets a single orange pixel at (487, 112).
; PLAN: r0=25(x), r1=14(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=60(y), r7=12(width), r8=65(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=487(x), r11=112(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 25
LDI r1, 14
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 60
LDI r7, 12
LDI r8, 65
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 112
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
