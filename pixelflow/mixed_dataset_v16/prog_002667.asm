; DESCRIPTION: Creates a black rectangular region at (27, 142) spanning 50 by 12 pixels.
; PLAN: r0=27(x), r1=142(y), r2=50(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 142
LDI r2, 50
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
