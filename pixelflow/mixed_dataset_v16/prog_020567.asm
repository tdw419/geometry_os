; DESCRIPTION: Composite: Places a white dot at position (460, 128) then Places a orange 36x44 rectangle at position (405, 188) then Places a cyan circle of radius 23 at center (416, 33).
; PLAN: r0=460(x), r1=128(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=188(y), r7=36(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=416(x), r11=33(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 128
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 188
LDI r7, 36
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 416
LDI r11, 33
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
