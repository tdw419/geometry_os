; DESCRIPTION: Creates a red rectangular region at (400, 128) spanning 30 by 10 pixels.
; PLAN: r0=400(x), r1=128(y), r2=30(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 128
LDI r2, 30
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
