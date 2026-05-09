; DESCRIPTION: Creates a red rectangular region at (59, 144) spanning 41 by 61 pixels.
; PLAN: r0=59(x), r1=144(y), r2=41(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 144
LDI r2, 41
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
