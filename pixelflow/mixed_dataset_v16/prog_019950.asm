; DESCRIPTION: Creates a yellow rectangular region at (90, 58) spanning 42 by 10 pixels.
; PLAN: r0=90(x), r1=58(y), r2=42(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 58
LDI r2, 42
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
