; DESCRIPTION: Creates a yellow rectangular region at (383, 126) spanning 27 by 103 pixels.
; PLAN: r0=383(x), r1=126(y), r2=27(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 126
LDI r2, 27
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
