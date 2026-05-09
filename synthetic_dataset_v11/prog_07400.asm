; DESCRIPTION: Creates a cyan rectangular region at (131, 6) spanning 49 by 71 pixels.
; PLAN: r0=131(x), r1=6(y), r2=49(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 6
LDI r2, 49
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
