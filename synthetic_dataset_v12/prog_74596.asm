; DESCRIPTION: Creates a cyan rectangular region at (148, 182) spanning 104 by 71 pixels.
; PLAN: r0=148(x), r1=182(y), r2=104(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 182
LDI r2, 104
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
