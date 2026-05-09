; DESCRIPTION: Creates a orange rectangular region at (2, 221) spanning 61 by 30 pixels.
; PLAN: r0=2(x), r1=221(y), r2=61(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 221
LDI r2, 61
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
