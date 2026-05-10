; DESCRIPTION: Creates a cyan rectangular region at (326, 77) spanning 47 by 107 pixels.
; PLAN: r0=326(x), r1=77(y), r2=47(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 77
LDI r2, 47
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
