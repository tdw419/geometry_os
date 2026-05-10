; DESCRIPTION: Creates a black rectangular region at (113, 124) spanning 99 by 107 pixels.
; PLAN: r0=113(x), r1=124(y), r2=99(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 124
LDI r2, 99
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
