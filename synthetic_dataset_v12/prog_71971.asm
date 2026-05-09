; DESCRIPTION: Creates a red rectangular region at (284, 10) spanning 13 by 71 pixels.
; PLAN: r0=284(x), r1=10(y), r2=13(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 10
LDI r2, 13
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
