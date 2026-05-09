; DESCRIPTION: Composite: Sets a single magenta pixel at (350, 56) then Renders a orange disk with center (307, 95) and radius 31 then Creates a magenta rectangular region at (401, 34) spanning 109 by 67 pixels.
; PLAN: r0=350(x), r1=56(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=95(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=401(x), r11=34(y), r12=109(width), r13=67(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 350
LDI r1, 56
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 95
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 401
LDI r11, 34
LDI r12, 109
LDI r13, 67
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
