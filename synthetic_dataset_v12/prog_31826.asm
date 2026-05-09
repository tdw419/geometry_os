; DESCRIPTION: Creates a orange rectangular region at (302, 207) spanning 74 by 42 pixels.
; PLAN: r0=302(x), r1=207(y), r2=74(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 207
LDI r2, 74
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
