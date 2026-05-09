; DESCRIPTION: Creates a black rectangular region at (82, 37) spanning 111 by 120 pixels.
; PLAN: r0=82(x), r1=37(y), r2=111(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 37
LDI r2, 111
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
