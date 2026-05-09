; DESCRIPTION: Creates a red rectangular region at (284, 163) spanning 101 by 75 pixels.
; PLAN: r0=284(x), r1=163(y), r2=101(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 163
LDI r2, 101
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
