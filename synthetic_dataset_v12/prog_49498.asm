; DESCRIPTION: Creates a yellow rectangular region at (46, 24) spanning 37 by 42 pixels.
; PLAN: r0=46(x), r1=24(y), r2=37(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 24
LDI r2, 37
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
