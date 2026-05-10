; DESCRIPTION: Creates a orange rectangular region at (475, 150) spanning 21 by 47 pixels.
; PLAN: r0=475(x), r1=150(y), r2=21(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 150
LDI r2, 21
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
