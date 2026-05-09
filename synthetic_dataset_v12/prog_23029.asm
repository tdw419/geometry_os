; DESCRIPTION: Creates a cyan rectangular region at (127, 138) spanning 109 by 105 pixels.
; PLAN: r0=127(x), r1=138(y), r2=109(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 138
LDI r2, 109
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
