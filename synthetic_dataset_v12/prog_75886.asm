; DESCRIPTION: Creates a black rectangular region at (20, 112) spanning 42 by 36 pixels.
; PLAN: r0=20(x), r1=112(y), r2=42(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 112
LDI r2, 42
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
