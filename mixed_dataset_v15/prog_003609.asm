; DESCRIPTION: Creates a cyan rectangular region at (141, 55) spanning 21 by 10 pixels.
; PLAN: r0=141(x), r1=55(y), r2=21(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 55
LDI r2, 21
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
