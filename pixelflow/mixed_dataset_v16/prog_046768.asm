; DESCRIPTION: Creates a cyan rectangular region at (403, 21) spanning 100 by 69 pixels.
; PLAN: r0=403(x), r1=21(y), r2=100(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 21
LDI r2, 100
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
