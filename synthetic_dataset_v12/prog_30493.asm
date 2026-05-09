; DESCRIPTION: Composite: Places a magenta dot at position (401, 111) then Places a white circle of radius 11 at center (241, 87) then Creates a purple rectangular region at (90, 127) spanning 54 by 63 pixels.
; PLAN: r0=401(x), r1=111(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=87(y), r7=11(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x), r11=127(y), r12=54(width), r13=63(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 111
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 87
LDI r7, 11
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 127
LDI r12, 54
LDI r13, 63
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
