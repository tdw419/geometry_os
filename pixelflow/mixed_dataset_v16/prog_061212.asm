; DESCRIPTION: Composite: Places a white line segment connecting (296, 143) to (256, 87) then Renders a magenta box of size 119x45 starting at (134, 184) then Places a orange dot at position (238, 224).
; PLAN: r0=296(x1), r1=143(y1), r2=256(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=184(y), r7=119(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=238(x), r11=224(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 296
LDI r1, 143
LDI r2, 256
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 184
LDI r7, 119
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 224
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
