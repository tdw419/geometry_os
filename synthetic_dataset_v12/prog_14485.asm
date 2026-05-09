; DESCRIPTION: Creates a cyan rectangular region at (193, 141) spanning 18 by 63 pixels.
; PLAN: r0=193(x), r1=141(y), r2=18(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 141
LDI r2, 18
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
