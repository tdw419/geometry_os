; DESCRIPTION: Creates a cyan rectangular region at (108, 138) spanning 27 by 98 pixels.
; PLAN: r0=108(x), r1=138(y), r2=27(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 138
LDI r2, 27
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
