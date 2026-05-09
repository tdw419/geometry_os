; DESCRIPTION: Creates a yellow rectangular region at (18, 111) spanning 15 by 27 pixels.
; PLAN: r0=18(x), r1=111(y), r2=15(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 111
LDI r2, 15
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
