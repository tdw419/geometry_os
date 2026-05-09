; DESCRIPTION: Creates a yellow rectangular region at (210, 17) spanning 42 by 70 pixels.
; PLAN: r0=210(x), r1=17(y), r2=42(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 17
LDI r2, 42
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
