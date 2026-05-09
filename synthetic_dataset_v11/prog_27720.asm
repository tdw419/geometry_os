; DESCRIPTION: Creates a cyan rectangular region at (68, 102) spanning 33 by 103 pixels.
; PLAN: r0=68(x), r1=102(y), r2=33(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 102
LDI r2, 33
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
