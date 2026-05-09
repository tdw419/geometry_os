; DESCRIPTION: Creates a yellow rectangular region at (52, 7) spanning 60 by 113 pixels.
; PLAN: r0=52(x), r1=7(y), r2=60(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 7
LDI r2, 60
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
