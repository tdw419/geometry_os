; DESCRIPTION: Creates a cyan rectangular region at (322, 208) spanning 30 by 11 pixels.
; PLAN: r0=322(x), r1=208(y), r2=30(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 208
LDI r2, 30
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
