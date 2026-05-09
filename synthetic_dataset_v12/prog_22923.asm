; DESCRIPTION: Composite: Renders a orange box of size 50x32 starting at (458, 121) then Places a green dot at position (423, 149) then Renders a cyan disk with center (424, 58) and radius 43.
; PLAN: r0=458(x), r1=121(y), r2=50(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=149(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=424(x), r11=58(y), r12=43(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 458
LDI r1, 121
LDI r2, 50
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 149
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 424
LDI r11, 58
LDI r12, 43
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
