; DESCRIPTION: Composite: Creates a red circular shape at (337, 98) with radius 67 then Places a purple dot at position (309, 191) then Creates a orange rectangular region at (132, 41) spanning 79 by 70 pixels.
; PLAN: r0=337(x), r1=98(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=191(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=132(x), r11=41(y), r12=79(width), r13=70(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 337
LDI r1, 98
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 191
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 132
LDI r11, 41
LDI r12, 79
LDI r13, 70
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
