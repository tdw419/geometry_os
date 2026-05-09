; DESCRIPTION: Composite: Places a red dot at position (421, 112) then Renders a orange disk with center (124, 203) and radius 46 then Renders a cyan box of size 100x99 starting at (13, 46).
; PLAN: r0=421(x), r1=112(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=203(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=13(x), r11=46(y), r12=100(width), r13=99(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 112
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 124
LDI r6, 203
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 13
LDI r11, 46
LDI r12, 100
LDI r13, 99
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
