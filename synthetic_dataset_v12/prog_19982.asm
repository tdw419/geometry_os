; DESCRIPTION: Creates a magenta rectangular region at (275, 191) spanning 48 by 65 pixels.
; PLAN: r0=275(x), r1=191(y), r2=48(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 191
LDI r2, 48
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
