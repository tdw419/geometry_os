; DESCRIPTION: Creates a cyan rectangular region at (250, 59) spanning 73 by 24 pixels.
; PLAN: r0=250(x), r1=59(y), r2=73(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 59
LDI r2, 73
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
