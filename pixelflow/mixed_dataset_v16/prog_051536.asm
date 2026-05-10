; DESCRIPTION: Composite: Creates a red rectangular region at (351, 84) spanning 65 by 82 pixels then Places a red circle of radius 42 at center (120, 97) then Places a cyan dot at position (218, 214).
; PLAN: r0=351(x), r1=84(y), r2=65(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=97(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=218(x), r11=214(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 84
LDI r2, 65
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 97
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 218
LDI r11, 214
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
