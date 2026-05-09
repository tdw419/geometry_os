; DESCRIPTION: Creates a red rectangular region at (38, 149) spanning 120 by 76 pixels.
; PLAN: r0=38(x), r1=149(y), r2=120(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 149
LDI r2, 120
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
