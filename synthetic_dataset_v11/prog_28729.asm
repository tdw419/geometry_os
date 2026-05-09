; DESCRIPTION: Creates a orange rectangular region at (186, 163) spanning 28 by 47 pixels.
; PLAN: r0=186(x), r1=163(y), r2=28(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 163
LDI r2, 28
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
