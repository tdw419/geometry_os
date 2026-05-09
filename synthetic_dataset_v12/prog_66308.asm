; DESCRIPTION: Creates a cyan rectangular region at (232, 133) spanning 91 by 59 pixels.
; PLAN: r0=232(x), r1=133(y), r2=91(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 133
LDI r2, 91
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
