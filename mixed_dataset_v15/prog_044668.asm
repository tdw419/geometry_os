; DESCRIPTION: Creates a cyan rectangular region at (322, 186) spanning 49 by 65 pixels.
; PLAN: r0=322(x), r1=186(y), r2=49(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 186
LDI r2, 49
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
