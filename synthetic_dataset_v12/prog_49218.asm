; DESCRIPTION: Creates a cyan rectangular region at (94, 171) spanning 40 by 77 pixels.
; PLAN: r0=94(x), r1=171(y), r2=40(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 171
LDI r2, 40
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
