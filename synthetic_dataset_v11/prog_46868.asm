; DESCRIPTION: Creates a yellow rectangular region at (32, 191) spanning 65 by 42 pixels.
; PLAN: r0=32(x), r1=191(y), r2=65(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 191
LDI r2, 65
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
