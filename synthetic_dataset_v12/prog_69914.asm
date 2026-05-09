; DESCRIPTION: Creates a red rectangular region at (434, 22) spanning 59 by 100 pixels.
; PLAN: r0=434(x), r1=22(y), r2=59(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 22
LDI r2, 59
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
