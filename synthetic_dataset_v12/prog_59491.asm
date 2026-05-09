; DESCRIPTION: Creates a orange rectangular region at (411, 65) spanning 60 by 42 pixels.
; PLAN: r0=411(x), r1=65(y), r2=60(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 65
LDI r2, 60
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
