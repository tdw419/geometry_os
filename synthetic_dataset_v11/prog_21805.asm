; DESCRIPTION: Creates a cyan rectangular region at (53, 45) spanning 103 by 102 pixels.
; PLAN: r0=53(x), r1=45(y), r2=103(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 45
LDI r2, 103
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
