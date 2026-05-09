; DESCRIPTION: Creates a cyan rectangular region at (104, 99) spanning 60 by 82 pixels.
; PLAN: r0=104(x), r1=99(y), r2=60(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 99
LDI r2, 60
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
