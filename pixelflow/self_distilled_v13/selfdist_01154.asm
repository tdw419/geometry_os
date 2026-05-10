; DESCRIPTION: Renders a white rectangular region spanning 106 by 79 at (166, 42).
; PLAN: r0=166(x), r1=42(y), r2=106(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 42
LDI r2, 106
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
