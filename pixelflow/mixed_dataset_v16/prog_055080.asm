; DESCRIPTION: Creates a cyan rectangular region at (250, 86) spanning 90 by 92 pixels.
; PLAN: r0=250(x), r1=86(y), r2=90(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 86
LDI r2, 90
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
