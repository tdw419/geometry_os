; DESCRIPTION: Creates a red rectangular region at (13, 154) spanning 92 by 55 pixels.
; PLAN: r0=13(x), r1=154(y), r2=92(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 154
LDI r2, 92
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
