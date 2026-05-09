; DESCRIPTION: Creates a black rectangular region at (54, 93) spanning 42 by 32 pixels.
; PLAN: r0=54(x), r1=93(y), r2=42(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 93
LDI r2, 42
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
