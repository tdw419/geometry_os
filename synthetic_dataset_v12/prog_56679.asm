; DESCRIPTION: Creates a red rectangular region at (260, 2) spanning 39 by 11 pixels.
; PLAN: r0=260(x), r1=2(y), r2=39(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 2
LDI r2, 39
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
