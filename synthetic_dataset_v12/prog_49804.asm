; DESCRIPTION: Composite: Places a white dot at position (143, 14) then Places a purple circle of radius 43 at center (437, 108) then Places a cyan 27x95 rectangle at position (115, 96).
; PLAN: r0=143(x), r1=14(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=437(x), r6=108(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x), r11=96(y), r12=27(width), r13=95(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 14
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 437
LDI r6, 108
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 96
LDI r12, 27
LDI r13, 95
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
