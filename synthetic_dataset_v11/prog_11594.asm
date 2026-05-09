; DESCRIPTION: Creates a orange rectangular region at (168, 29) spanning 51 by 103 pixels.
; PLAN: r0=168(x), r1=29(y), r2=51(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 29
LDI r2, 51
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
