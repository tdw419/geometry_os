; DESCRIPTION: Creates a cyan rectangular region at (304, 94) spanning 93 by 65 pixels.
; PLAN: r0=304(x), r1=94(y), r2=93(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 94
LDI r2, 93
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
