; DESCRIPTION: Creates a orange rectangular region at (82, 86) spanning 95 by 63 pixels.
; PLAN: r0=82(x), r1=86(y), r2=95(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 86
LDI r2, 95
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
