; DESCRIPTION: Creates a cyan rectangular region at (322, 136) spanning 52 by 79 pixels.
; PLAN: r0=322(x), r1=136(y), r2=52(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 136
LDI r2, 52
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
