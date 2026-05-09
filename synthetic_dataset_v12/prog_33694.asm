; DESCRIPTION: Creates a cyan rectangular region at (374, 155) spanning 92 by 53 pixels.
; PLAN: r0=374(x), r1=155(y), r2=92(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 155
LDI r2, 92
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
