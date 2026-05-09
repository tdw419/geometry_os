; DESCRIPTION: Creates a magenta rectangular region at (284, 116) spanning 23 by 83 pixels.
; PLAN: r0=284(x), r1=116(y), r2=23(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 116
LDI r2, 23
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
