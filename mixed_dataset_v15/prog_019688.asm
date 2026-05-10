; DESCRIPTION: Composite: Places a orange dot at position (493, 33) then Places a white 58x14 rectangle at position (429, 167) then Places a red circle of radius 30 at center (387, 91).
; PLAN: r0=493(x), r1=33(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=167(y), r7=58(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x), r11=91(y), r12=30(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 493
LDI r1, 33
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 429
LDI r6, 167
LDI r7, 58
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 91
LDI r12, 30
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
