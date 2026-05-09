; DESCRIPTION: Creates a cyan rectangular region at (272, 108) spanning 60 by 61 pixels.
; PLAN: r0=272(x), r1=108(y), r2=60(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 108
LDI r2, 60
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
