; DESCRIPTION: Creates a cyan rectangular region at (200, 142) spanning 38 by 109 pixels.
; PLAN: r0=200(x), r1=142(y), r2=38(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 142
LDI r2, 38
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
