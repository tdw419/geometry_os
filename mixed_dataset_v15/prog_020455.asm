; DESCRIPTION: Creates a cyan rectangular region at (248, 182) spanning 30 by 42 pixels.
; PLAN: r0=248(x), r1=182(y), r2=30(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 182
LDI r2, 30
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
