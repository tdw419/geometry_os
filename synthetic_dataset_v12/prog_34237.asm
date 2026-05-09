; DESCRIPTION: Creates a white rectangular region at (246, 220) spanning 35 by 27 pixels.
; PLAN: r0=246(x), r1=220(y), r2=35(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 220
LDI r2, 35
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
