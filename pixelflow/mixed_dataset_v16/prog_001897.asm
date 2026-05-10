; DESCRIPTION: Creates a cyan rectangular region at (117, 171) spanning 85 by 46 pixels.
; PLAN: r0=117(x), r1=171(y), r2=85(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 171
LDI r2, 85
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
