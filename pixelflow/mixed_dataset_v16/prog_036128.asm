; DESCRIPTION: Creates a cyan rectangular region at (95, 123) spanning 46 by 92 pixels.
; PLAN: r0=95(x), r1=123(y), r2=46(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 123
LDI r2, 46
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
