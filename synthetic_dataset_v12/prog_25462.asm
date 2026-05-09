; DESCRIPTION: Creates a red rectangular region at (284, 111) spanning 95 by 69 pixels.
; PLAN: r0=284(x), r1=111(y), r2=95(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 111
LDI r2, 95
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
