; DESCRIPTION: Creates a green rectangular region at (82, 17) spanning 93 by 82 pixels.
; PLAN: r0=82(x), r1=17(y), r2=93(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 17
LDI r2, 93
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
