; DESCRIPTION: Creates a cyan rectangular region at (165, 94) spanning 71 by 29 pixels.
; PLAN: r0=165(x), r1=94(y), r2=71(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 94
LDI r2, 71
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
