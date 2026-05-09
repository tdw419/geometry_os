; DESCRIPTION: Creates a white rectangular region at (42, 51) spanning 58 by 104 pixels.
; PLAN: r0=42(x), r1=51(y), r2=58(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 51
LDI r2, 58
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
