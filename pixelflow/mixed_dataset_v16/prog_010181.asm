; DESCRIPTION: Composite: Places a yellow dot at position (77, 67) then Creates a magenta rectangular region at (485, 181) spanning 22 by 23 pixels.
; PLAN: r0=77(x), r1=67(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=485(x), r6=181(y), r7=22(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 67
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 485
LDI r6, 181
LDI r7, 22
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
