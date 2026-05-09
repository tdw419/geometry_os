; DESCRIPTION: Creates a cyan rectangular region at (303, 83) spanning 48 by 113 pixels.
; PLAN: r0=303(x), r1=83(y), r2=48(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 83
LDI r2, 48
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
