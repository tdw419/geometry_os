; DESCRIPTION: Composite: Places a black circle of radius 56 at center (135, 92) then Creates a orange rectangular region at (327, 140) spanning 45 by 57 pixels.
; PLAN: r0=135(x), r1=92(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=327(x), r6=140(y), r7=45(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 92
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 327
LDI r6, 140
LDI r7, 45
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
