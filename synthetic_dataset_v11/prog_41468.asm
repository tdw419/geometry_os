; DESCRIPTION: Creates a cyan rectangular region at (29, 38) spanning 106 by 27 pixels.
; PLAN: r0=29(x), r1=38(y), r2=106(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 38
LDI r2, 106
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
