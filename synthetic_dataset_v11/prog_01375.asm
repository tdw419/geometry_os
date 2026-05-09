; DESCRIPTION: Creates a black rectangular region at (113, 81) spanning 42 by 92 pixels.
; PLAN: r0=113(x), r1=81(y), r2=42(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 81
LDI r2, 42
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
