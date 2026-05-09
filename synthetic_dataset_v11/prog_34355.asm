; DESCRIPTION: Creates a cyan rectangular region at (132, 138) spanning 46 by 91 pixels.
; PLAN: r0=132(x), r1=138(y), r2=46(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 138
LDI r2, 46
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
