; DESCRIPTION: Creates a white rectangular region at (231, 127) spanning 38 by 109 pixels.
; PLAN: r0=231(x), r1=127(y), r2=38(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 127
LDI r2, 38
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
