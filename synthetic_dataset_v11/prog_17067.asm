; DESCRIPTION: Creates a yellow rectangular region at (79, 238) spanning 30 by 10 pixels.
; PLAN: r0=79(x), r1=238(y), r2=30(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 238
LDI r2, 30
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
