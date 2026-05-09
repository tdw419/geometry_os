; DESCRIPTION: Creates a orange rectangular region at (50, 141) spanning 91 by 94 pixels.
; PLAN: r0=50(x), r1=141(y), r2=91(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 141
LDI r2, 91
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
