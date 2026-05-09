; DESCRIPTION: Creates a white rectangular region at (111, 128) spanning 103 by 27 pixels.
; PLAN: r0=111(x), r1=128(y), r2=103(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 128
LDI r2, 103
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
