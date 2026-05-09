; DESCRIPTION: Creates a cyan rectangular region at (82, 182) spanning 119 by 63 pixels.
; PLAN: r0=82(x), r1=182(y), r2=119(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 182
LDI r2, 119
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
