; DESCRIPTION: Creates a magenta rectangular region at (284, 3) spanning 96 by 85 pixels.
; PLAN: r0=284(x), r1=3(y), r2=96(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 3
LDI r2, 96
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
