; DESCRIPTION: Creates a yellow rectangular region at (45, 164) spanning 96 by 48 pixels.
; PLAN: r0=45(x), r1=164(y), r2=96(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 164
LDI r2, 96
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
