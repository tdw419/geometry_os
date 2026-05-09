; DESCRIPTION: Creates a black rectangular region at (271, 117) spanning 23 by 93 pixels.
; PLAN: r0=271(x), r1=117(y), r2=23(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 117
LDI r2, 23
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
