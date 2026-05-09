; DESCRIPTION: Creates a orange rectangular region at (262, 42) spanning 92 by 98 pixels.
; PLAN: r0=262(x), r1=42(y), r2=92(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 42
LDI r2, 92
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
