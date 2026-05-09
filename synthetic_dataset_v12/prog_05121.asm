; DESCRIPTION: Creates a magenta rectangular region at (354, 46) spanning 83 by 98 pixels.
; PLAN: r0=354(x), r1=46(y), r2=83(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 46
LDI r2, 83
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
