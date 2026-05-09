; DESCRIPTION: Creates a red rectangular region at (248, 16) spanning 46 by 61 pixels.
; PLAN: r0=248(x), r1=16(y), r2=46(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 16
LDI r2, 46
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
