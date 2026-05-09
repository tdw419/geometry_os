; DESCRIPTION: Creates a orange rectangular region at (154, 201) spanning 82 by 42 pixels.
; PLAN: r0=154(x), r1=201(y), r2=82(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 201
LDI r2, 82
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
