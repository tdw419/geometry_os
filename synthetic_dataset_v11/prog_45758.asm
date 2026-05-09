; DESCRIPTION: Creates a cyan rectangular region at (117, 125) spanning 37 by 71 pixels.
; PLAN: r0=117(x), r1=125(y), r2=37(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 125
LDI r2, 37
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
