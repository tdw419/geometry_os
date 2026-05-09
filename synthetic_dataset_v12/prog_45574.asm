; DESCRIPTION: Creates a yellow rectangular region at (154, 95) spanning 92 by 60 pixels.
; PLAN: r0=154(x), r1=95(y), r2=92(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 95
LDI r2, 92
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
