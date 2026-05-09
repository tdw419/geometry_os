; DESCRIPTION: Composite: Places a red circle of radius 56 at center (307, 120) then Places a magenta dot at position (469, 250) then Creates a orange rectangular region at (361, 214) spanning 94 by 27 pixels.
; PLAN: r0=307(x), r1=120(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=250(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=361(x), r11=214(y), r12=94(width), r13=27(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 120
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 250
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 361
LDI r11, 214
LDI r12, 94
LDI r13, 27
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
