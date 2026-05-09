; DESCRIPTION: Creates a black rectangular region at (103, 117) spanning 27 by 37 pixels.
; PLAN: r0=103(x), r1=117(y), r2=27(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 117
LDI r2, 27
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
