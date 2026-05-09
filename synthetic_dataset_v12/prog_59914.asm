; DESCRIPTION: Creates a magenta rectangular region at (239, 164) spanning 71 by 10 pixels.
; PLAN: r0=239(x), r1=164(y), r2=71(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 164
LDI r2, 71
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
