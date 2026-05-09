; DESCRIPTION: Creates a white rectangular region at (361, 201) spanning 50 by 42 pixels.
; PLAN: r0=361(x), r1=201(y), r2=50(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 201
LDI r2, 50
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
