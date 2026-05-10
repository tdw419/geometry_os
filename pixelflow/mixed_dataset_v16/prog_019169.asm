; DESCRIPTION: Composite: Places a cyan dot at position (308, 57) then Creates a purple circular shape at (405, 72) with radius 44 then Creates a purple rectangular region at (410, 136) spanning 97 by 104 pixels.
; PLAN: r0=308(x), r1=57(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=72(y), r7=44(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x), r11=136(y), r12=97(width), r13=104(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 57
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 72
LDI r7, 44
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 136
LDI r12, 97
LDI r13, 104
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
