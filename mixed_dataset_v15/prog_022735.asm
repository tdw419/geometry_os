; DESCRIPTION: Composite: Creates a purple rectangular region at (327, 152) spanning 37 by 73 pixels then Places a red circle of radius 67 at center (353, 144) then Places a cyan dot at position (69, 176).
; PLAN: r0=327(x), r1=152(y), r2=37(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=144(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=69(x), r11=176(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 152
LDI r2, 37
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 144
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 69
LDI r11, 176
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
