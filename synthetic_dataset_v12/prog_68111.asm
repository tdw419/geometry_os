; DESCRIPTION: Creates a orange rectangular region at (277, 42) spanning 56 by 11 pixels.
; PLAN: r0=277(x), r1=42(y), r2=56(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 42
LDI r2, 56
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
