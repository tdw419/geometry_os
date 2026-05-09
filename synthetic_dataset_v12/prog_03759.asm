; DESCRIPTION: Creates a red rectangular region at (84, 16) spanning 91 by 120 pixels.
; PLAN: r0=84(x), r1=16(y), r2=91(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 16
LDI r2, 91
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
