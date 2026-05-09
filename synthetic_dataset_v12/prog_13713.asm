; DESCRIPTION: Creates a yellow rectangular region at (398, 134) spanning 38 by 39 pixels.
; PLAN: r0=398(x), r1=134(y), r2=38(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 134
LDI r2, 38
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
