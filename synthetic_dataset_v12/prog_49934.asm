; DESCRIPTION: Creates a yellow rectangular region at (60, 15) spanning 42 by 92 pixels.
; PLAN: r0=60(x), r1=15(y), r2=42(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 15
LDI r2, 42
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
