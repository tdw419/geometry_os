; DESCRIPTION: Creates a black rectangular region at (50, 93) spanning 51 by 55 pixels.
; PLAN: r0=50(x), r1=93(y), r2=51(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 93
LDI r2, 51
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
