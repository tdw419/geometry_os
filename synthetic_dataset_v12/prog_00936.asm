; DESCRIPTION: Creates a cyan rectangular region at (131, 189) spanning 83 by 10 pixels.
; PLAN: r0=131(x), r1=189(y), r2=83(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 189
LDI r2, 83
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
