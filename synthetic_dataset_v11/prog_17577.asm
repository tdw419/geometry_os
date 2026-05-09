; DESCRIPTION: Creates a yellow rectangular region at (159, 28) spanning 10 by 50 pixels.
; PLAN: r0=159(x), r1=28(y), r2=10(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 28
LDI r2, 10
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
