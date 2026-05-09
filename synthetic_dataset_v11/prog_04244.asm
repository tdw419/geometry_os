; DESCRIPTION: Creates a orange rectangular region at (168, 36) spanning 79 by 117 pixels.
; PLAN: r0=168(x), r1=36(y), r2=79(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 36
LDI r2, 79
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
