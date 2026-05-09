; DESCRIPTION: Creates a cyan rectangular region at (193, 155) spanning 54 by 82 pixels.
; PLAN: r0=193(x), r1=155(y), r2=54(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 155
LDI r2, 54
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
