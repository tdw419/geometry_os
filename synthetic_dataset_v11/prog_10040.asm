; DESCRIPTION: Creates a yellow rectangular region at (65, 132) spanning 45 by 42 pixels.
; PLAN: r0=65(x), r1=132(y), r2=45(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 132
LDI r2, 45
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
