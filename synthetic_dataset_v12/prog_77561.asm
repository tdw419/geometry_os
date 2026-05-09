; DESCRIPTION: Creates a orange rectangular region at (38, 129) spanning 22 by 95 pixels.
; PLAN: r0=38(x), r1=129(y), r2=22(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 129
LDI r2, 22
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
