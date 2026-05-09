; DESCRIPTION: Creates a cyan rectangular region at (420, 187) spanning 76 by 57 pixels.
; PLAN: r0=420(x), r1=187(y), r2=76(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 187
LDI r2, 76
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
