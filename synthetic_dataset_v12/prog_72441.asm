; DESCRIPTION: Creates a cyan rectangular region at (218, 160) spanning 47 by 93 pixels.
; PLAN: r0=218(x), r1=160(y), r2=47(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 160
LDI r2, 47
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
