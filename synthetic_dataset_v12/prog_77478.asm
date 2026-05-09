; DESCRIPTION: Composite: Places a cyan dot at position (382, 145) then Draws a white rectangle at (328, 18) with width 71 and height 79 then Places a white circle of radius 41 at center (88, 182).
; PLAN: r0=382(x), r1=145(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=18(y), r7=71(width), r8=79(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=182(y), r12=41(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 382
LDI r1, 145
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 18
LDI r7, 71
LDI r8, 79
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 182
LDI r12, 41
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
