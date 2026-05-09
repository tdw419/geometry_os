; DESCRIPTION: Creates a cyan rectangular region at (98, 182) spanning 24 by 48 pixels.
; PLAN: r0=98(x), r1=182(y), r2=24(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 182
LDI r2, 24
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
