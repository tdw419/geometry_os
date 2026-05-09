; DESCRIPTION: Creates a green rectangular region at (91, 67) spanning 62 by 42 pixels.
; PLAN: r0=91(x), r1=67(y), r2=62(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 67
LDI r2, 62
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
