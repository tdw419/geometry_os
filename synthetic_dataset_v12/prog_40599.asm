; DESCRIPTION: Creates a cyan rectangular region at (279, 102) spanning 56 by 48 pixels.
; PLAN: r0=279(x), r1=102(y), r2=56(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 102
LDI r2, 56
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
