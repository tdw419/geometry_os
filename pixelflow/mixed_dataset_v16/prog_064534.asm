; DESCRIPTION: Composite: Sets a single cyan pixel at (404, 60) then Places a green circle of radius 23 at center (374, 155) then Creates a red rectangular region at (367, 141) spanning 86 by 14 pixels.
; PLAN: r0=404(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=155(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=367(x), r11=141(y), r12=86(width), r13=14(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 404
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 374
LDI r6, 155
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 367
LDI r11, 141
LDI r12, 86
LDI r13, 14
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
