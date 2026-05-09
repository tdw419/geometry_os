; DESCRIPTION: Creates a cyan rectangular region at (301, 40) spanning 93 by 59 pixels.
; PLAN: r0=301(x), r1=40(y), r2=93(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 40
LDI r2, 93
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
