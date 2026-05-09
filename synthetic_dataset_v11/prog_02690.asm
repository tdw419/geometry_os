; DESCRIPTION: Creates a cyan rectangular region at (77, 111) spanning 44 by 11 pixels.
; PLAN: r0=77(x), r1=111(y), r2=44(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 111
LDI r2, 44
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
