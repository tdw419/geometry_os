; DESCRIPTION: Creates a black rectangular region at (140, 5) spanning 59 by 42 pixels.
; PLAN: r0=140(x), r1=5(y), r2=59(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 5
LDI r2, 59
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
