; DESCRIPTION: Creates a cyan rectangular region at (322, 35) spanning 119 by 24 pixels.
; PLAN: r0=322(x), r1=35(y), r2=119(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 35
LDI r2, 119
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
