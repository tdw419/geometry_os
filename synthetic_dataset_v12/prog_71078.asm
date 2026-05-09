; DESCRIPTION: Creates a green rectangular region at (304, 146) spanning 42 by 49 pixels.
; PLAN: r0=304(x), r1=146(y), r2=42(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 146
LDI r2, 42
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
