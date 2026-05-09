; DESCRIPTION: Creates a cyan rectangular region at (118, 43) spanning 58 by 120 pixels.
; PLAN: r0=118(x), r1=43(y), r2=58(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 43
LDI r2, 58
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
