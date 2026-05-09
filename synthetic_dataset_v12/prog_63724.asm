; DESCRIPTION: Creates a cyan rectangular region at (106, 33) spanning 103 by 72 pixels.
; PLAN: r0=106(x), r1=33(y), r2=103(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 33
LDI r2, 103
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
