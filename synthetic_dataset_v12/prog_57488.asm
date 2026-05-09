; DESCRIPTION: Creates a cyan rectangular region at (82, 158) spanning 101 by 92 pixels.
; PLAN: r0=82(x), r1=158(y), r2=101(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 158
LDI r2, 101
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
