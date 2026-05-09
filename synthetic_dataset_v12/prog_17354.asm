; DESCRIPTION: Creates a black rectangular region at (175, 1) spanning 59 by 42 pixels.
; PLAN: r0=175(x), r1=1(y), r2=59(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 1
LDI r2, 59
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
