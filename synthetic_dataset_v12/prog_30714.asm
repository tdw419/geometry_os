; DESCRIPTION: Creates a white rectangular region at (394, 141) spanning 67 by 65 pixels.
; PLAN: r0=394(x), r1=141(y), r2=67(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 141
LDI r2, 67
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
