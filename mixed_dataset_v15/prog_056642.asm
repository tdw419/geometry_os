; DESCRIPTION: Composite: Creates a cyan circular shape at (403, 67) with radius 48 then Creates a cyan rectangular region at (56, 46) spanning 104 by 40 pixels then Places a purple dot at position (405, 67).
; PLAN: r0=403(x), r1=67(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=46(y), r7=104(width), r8=40(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=405(x), r11=67(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 67
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 46
LDI r7, 104
LDI r8, 40
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 67
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
