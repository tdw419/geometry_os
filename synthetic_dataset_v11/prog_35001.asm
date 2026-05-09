; DESCRIPTION: Creates a cyan rectangular region at (209, 20) spanning 24 by 12 pixels.
; PLAN: r0=209(x), r1=20(y), r2=24(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 20
LDI r2, 24
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
