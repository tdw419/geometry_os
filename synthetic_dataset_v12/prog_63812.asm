; DESCRIPTION: Creates a black rectangular region at (268, 154) spanning 51 by 51 pixels.
; PLAN: r0=268(x), r1=154(y), r2=51(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 154
LDI r2, 51
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
