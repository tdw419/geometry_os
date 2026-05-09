; DESCRIPTION: Creates a black rectangular region at (24, 177) spanning 59 by 61 pixels.
; PLAN: r0=24(x), r1=177(y), r2=59(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 177
LDI r2, 59
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
