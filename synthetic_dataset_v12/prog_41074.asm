; DESCRIPTION: Composite: Sets a single cyan pixel at (124, 231) then Draws a orange rectangle at (306, 161) with width 56 and height 27 then Creates a red circular shape at (224, 193) with radius 28.
; PLAN: r0=124(x), r1=231(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=161(y), r7=56(width), r8=27(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x), r11=193(y), r12=28(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 124
LDI r1, 231
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 306
LDI r6, 161
LDI r7, 56
LDI r8, 27
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 193
LDI r12, 28
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
