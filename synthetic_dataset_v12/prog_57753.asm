; DESCRIPTION: Creates a cyan rectangular region at (249, 46) spanning 60 by 111 pixels.
; PLAN: r0=249(x), r1=46(y), r2=60(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 46
LDI r2, 60
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
