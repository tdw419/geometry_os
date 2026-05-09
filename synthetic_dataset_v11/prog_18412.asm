; DESCRIPTION: Creates a cyan rectangular region at (2, 138) spanning 109 by 117 pixels.
; PLAN: r0=2(x), r1=138(y), r2=109(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 138
LDI r2, 109
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
