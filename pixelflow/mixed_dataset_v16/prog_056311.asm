; DESCRIPTION: Composite: Creates a blue circular shape at (391, 223) with radius 27 then Renders a orange box of size 59x87 starting at (370, 93) then Places a purple dot at position (205, 231).
; PLAN: r0=391(x), r1=223(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=93(y), r7=59(width), r8=87(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=205(x), r11=231(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 223
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 93
LDI r7, 59
LDI r8, 87
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 231
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
