; DESCRIPTION: Creates a white rectangular region at (36, 89) spanning 39 by 42 pixels.
; PLAN: r0=36(x), r1=89(y), r2=39(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 89
LDI r2, 39
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
