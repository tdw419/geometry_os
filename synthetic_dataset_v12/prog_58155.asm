; DESCRIPTION: Creates a white rectangular region at (254, 38) spanning 111 by 16 pixels.
; PLAN: r0=254(x), r1=38(y), r2=111(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 38
LDI r2, 111
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
