; DESCRIPTION: Creates a orange rectangular region at (92, 230) spanning 37 by 21 pixels.
; PLAN: r0=92(x), r1=230(y), r2=37(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 230
LDI r2, 37
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
