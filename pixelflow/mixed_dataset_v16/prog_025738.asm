; DESCRIPTION: Creates a orange rectangular region at (116, 129) spanning 40 by 78 pixels.
; PLAN: r0=116(x), r1=129(y), r2=40(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 129
LDI r2, 40
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
