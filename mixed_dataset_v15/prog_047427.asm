; DESCRIPTION: Creates a red rectangular region at (161, 59) spanning 95 by 107 pixels.
; PLAN: r0=161(x), r1=59(y), r2=95(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 59
LDI r2, 95
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
