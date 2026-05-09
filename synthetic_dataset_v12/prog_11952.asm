; DESCRIPTION: Creates a orange rectangular region at (39, 221) spanning 92 by 25 pixels.
; PLAN: r0=39(x), r1=221(y), r2=92(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 221
LDI r2, 92
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
