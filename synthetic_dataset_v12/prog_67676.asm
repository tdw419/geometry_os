; DESCRIPTION: Composite: Places a cyan circle of radius 21 at center (178, 46) then Sets a single white pixel at (466, 6) then Renders a orange box of size 27x59 starting at (316, 70).
; PLAN: r0=178(x), r1=46(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=6(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=316(x), r11=70(y), r12=27(width), r13=59(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 46
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 6
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 316
LDI r11, 70
LDI r12, 27
LDI r13, 59
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
