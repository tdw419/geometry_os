; DESCRIPTION: Creates a black rectangular region at (243, 126) spanning 92 by 58 pixels.
; PLAN: r0=243(x), r1=126(y), r2=92(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 126
LDI r2, 92
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
