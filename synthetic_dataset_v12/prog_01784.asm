; DESCRIPTION: Creates a yellow rectangular region at (299, 46) spanning 42 by 98 pixels.
; PLAN: r0=299(x), r1=46(y), r2=42(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 46
LDI r2, 42
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
