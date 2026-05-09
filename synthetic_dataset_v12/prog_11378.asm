; DESCRIPTION: Composite: Places a green dot at position (352, 56) then Creates a red circular shape at (108, 125) with radius 42 then Renders a black box of size 44x75 starting at (410, 64).
; PLAN: r0=352(x), r1=56(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=125(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x), r11=64(y), r12=44(width), r13=75(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 56
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 125
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 64
LDI r12, 44
LDI r13, 75
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
