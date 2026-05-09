; DESCRIPTION: Creates a white rectangular region at (151, 55) spanning 111 by 27 pixels.
; PLAN: r0=151(x), r1=55(y), r2=111(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 55
LDI r2, 111
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
