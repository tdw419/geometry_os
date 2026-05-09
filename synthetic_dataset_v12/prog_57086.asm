; DESCRIPTION: Creates a red rectangular region at (284, 8) spanning 100 by 60 pixels.
; PLAN: r0=284(x), r1=8(y), r2=100(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 8
LDI r2, 100
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
