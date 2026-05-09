; DESCRIPTION: Creates a red rectangular region at (284, 106) spanning 117 by 96 pixels.
; PLAN: r0=284(x), r1=106(y), r2=117(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 106
LDI r2, 117
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
