; DESCRIPTION: Composite: Renders a white box of size 85x67 starting at (67, 7) then Creates a red circular shape at (392, 68) with radius 67 then Places a green dot at position (275, 47).
; PLAN: r0=67(x), r1=7(y), r2=85(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=68(y), r7=67(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=275(x), r11=47(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 67
LDI r1, 7
LDI r2, 85
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 68
LDI r7, 67
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 275
LDI r11, 47
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
