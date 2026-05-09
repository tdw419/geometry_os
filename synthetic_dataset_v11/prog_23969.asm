; DESCRIPTION: Creates a red rectangular region at (168, 194) spanning 54 by 26 pixels.
; PLAN: r0=168(x), r1=194(y), r2=54(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 194
LDI r2, 54
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
