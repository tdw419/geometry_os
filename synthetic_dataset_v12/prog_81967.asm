; DESCRIPTION: Composite: Renders a orange box of size 44x22 starting at (215, 191) then Renders a orange disk with center (283, 32) and radius 19 then Places a cyan dot at position (283, 29).
; PLAN: r0=215(x), r1=191(y), r2=44(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=32(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=29(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 191
LDI r2, 44
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 32
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 29
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
