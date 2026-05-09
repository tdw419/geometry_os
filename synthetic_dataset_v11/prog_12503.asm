; DESCRIPTION: Creates a cyan rectangular region at (84, 111) spanning 93 by 26 pixels.
; PLAN: r0=84(x), r1=111(y), r2=93(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 111
LDI r2, 93
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
