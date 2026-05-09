; DESCRIPTION: Creates a cyan rectangular region at (363, 101) spanning 67 by 51 pixels.
; PLAN: r0=363(x), r1=101(y), r2=67(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 101
LDI r2, 67
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
