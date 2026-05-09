; DESCRIPTION: Creates a white rectangular region at (140, 197) spanning 101 by 27 pixels.
; PLAN: r0=140(x), r1=197(y), r2=101(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 197
LDI r2, 101
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
