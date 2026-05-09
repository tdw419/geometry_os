; DESCRIPTION: Creates a white rectangular region at (304, 33) spanning 111 by 107 pixels.
; PLAN: r0=304(x), r1=33(y), r2=111(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 33
LDI r2, 111
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
