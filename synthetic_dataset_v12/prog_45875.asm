; DESCRIPTION: Creates a cyan rectangular region at (193, 127) spanning 86 by 47 pixels.
; PLAN: r0=193(x), r1=127(y), r2=86(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 127
LDI r2, 86
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
