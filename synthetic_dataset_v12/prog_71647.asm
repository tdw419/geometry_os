; DESCRIPTION: Creates a white rectangular region at (161, 208) spanning 120 by 12 pixels.
; PLAN: r0=161(x), r1=208(y), r2=120(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 208
LDI r2, 120
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
