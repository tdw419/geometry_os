; DESCRIPTION: Creates a cyan rectangular region at (400, 6) spanning 19 by 57 pixels.
; PLAN: r0=400(x), r1=6(y), r2=19(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 6
LDI r2, 19
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
