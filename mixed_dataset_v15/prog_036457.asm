; DESCRIPTION: Creates a orange rectangular region at (300, 28) spanning 74 by 98 pixels.
; PLAN: r0=300(x), r1=28(y), r2=74(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 28
LDI r2, 74
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
