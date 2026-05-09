; DESCRIPTION: Creates a orange rectangular region at (36, 46) spanning 54 by 47 pixels.
; PLAN: r0=36(x), r1=46(y), r2=54(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 46
LDI r2, 54
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
