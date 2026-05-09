; DESCRIPTION: Creates a green rectangular region at (301, 50) spanning 76 by 109 pixels.
; PLAN: r0=301(x), r1=50(y), r2=76(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 50
LDI r2, 76
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
