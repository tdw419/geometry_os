; DESCRIPTION: Creates a cyan rectangular region at (202, 69) spanning 17 by 70 pixels.
; PLAN: r0=202(x), r1=69(y), r2=17(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 69
LDI r2, 17
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
