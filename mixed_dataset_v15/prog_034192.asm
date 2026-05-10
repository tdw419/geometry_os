; DESCRIPTION: Creates a white rectangular region at (113, 68) spanning 45 by 42 pixels.
; PLAN: r0=113(x), r1=68(y), r2=45(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 68
LDI r2, 45
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
