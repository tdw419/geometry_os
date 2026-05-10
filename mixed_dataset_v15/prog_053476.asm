; DESCRIPTION: Creates a red rectangular region at (164, 40) spanning 23 by 46 pixels.
; PLAN: r0=164(x), r1=40(y), r2=23(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 40
LDI r2, 23
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
