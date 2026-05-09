; DESCRIPTION: Creates a red rectangular region at (97, 164) spanning 50 by 33 pixels.
; PLAN: r0=97(x), r1=164(y), r2=50(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 164
LDI r2, 50
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
