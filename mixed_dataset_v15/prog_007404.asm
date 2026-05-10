; DESCRIPTION: Creates a orange rectangular region at (239, 1) spanning 85 by 104 pixels.
; PLAN: r0=239(x), r1=1(y), r2=85(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 1
LDI r2, 85
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
