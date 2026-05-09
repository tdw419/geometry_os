; DESCRIPTION: Creates a black rectangular region at (27, 61) spanning 93 by 71 pixels.
; PLAN: r0=27(x), r1=61(y), r2=93(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 61
LDI r2, 93
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
