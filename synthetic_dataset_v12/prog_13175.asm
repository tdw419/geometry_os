; DESCRIPTION: Creates a cyan rectangular region at (193, 174) spanning 39 by 35 pixels.
; PLAN: r0=193(x), r1=174(y), r2=39(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 174
LDI r2, 39
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
