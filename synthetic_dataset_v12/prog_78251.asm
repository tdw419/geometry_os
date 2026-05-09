; DESCRIPTION: Creates a magenta rectangular region at (394, 189) spanning 87 by 43 pixels.
; PLAN: r0=394(x), r1=189(y), r2=87(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 189
LDI r2, 87
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
