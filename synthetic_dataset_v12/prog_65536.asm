; DESCRIPTION: Creates a cyan rectangular region at (400, 185) spanning 102 by 70 pixels.
; PLAN: r0=400(x), r1=185(y), r2=102(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 185
LDI r2, 102
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
