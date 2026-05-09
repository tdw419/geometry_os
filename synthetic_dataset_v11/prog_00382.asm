; DESCRIPTION: Creates a orange rectangular region at (50, 204) spanning 94 by 16 pixels.
; PLAN: r0=50(x), r1=204(y), r2=94(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 204
LDI r2, 94
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
