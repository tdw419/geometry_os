; DESCRIPTION: Creates a black rectangular region at (36, 6) spanning 86 by 42 pixels.
; PLAN: r0=36(x), r1=6(y), r2=86(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 6
LDI r2, 86
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
