; DESCRIPTION: Creates a cyan rectangular region at (178, 167) spanning 65 by 46 pixels.
; PLAN: r0=178(x), r1=167(y), r2=65(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 167
LDI r2, 65
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
