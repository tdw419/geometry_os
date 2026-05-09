; DESCRIPTION: Creates a cyan rectangular region at (385, 82) spanning 15 by 87 pixels.
; PLAN: r0=385(x), r1=82(y), r2=15(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 82
LDI r2, 15
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
