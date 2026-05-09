; DESCRIPTION: Creates a red rectangular region at (86, 205) spanning 65 by 40 pixels.
; PLAN: r0=86(x), r1=205(y), r2=65(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 205
LDI r2, 65
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
