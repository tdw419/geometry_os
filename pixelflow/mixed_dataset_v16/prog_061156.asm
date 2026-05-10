; DESCRIPTION: Creates a magenta rectangular region at (284, 13) spanning 20 by 93 pixels.
; PLAN: r0=284(x), r1=13(y), r2=20(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 13
LDI r2, 20
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
