; DESCRIPTION: Creates a cyan rectangular region at (225, 130) spanning 25 by 29 pixels.
; PLAN: r0=225(x), r1=130(y), r2=25(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 130
LDI r2, 25
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
