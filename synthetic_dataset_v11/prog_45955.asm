; DESCRIPTION: Creates a orange rectangular region at (159, 151) spanning 42 by 61 pixels.
; PLAN: r0=159(x), r1=151(y), r2=42(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 151
LDI r2, 42
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
