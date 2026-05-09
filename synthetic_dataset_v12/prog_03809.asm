; DESCRIPTION: Creates a cyan rectangular region at (379, 82) spanning 102 by 64 pixels.
; PLAN: r0=379(x), r1=82(y), r2=102(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 82
LDI r2, 102
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
