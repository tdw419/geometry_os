; DESCRIPTION: Creates a yellow rectangular region at (173, 28) spanning 50 by 20 pixels.
; PLAN: r0=173(x), r1=28(y), r2=50(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 28
LDI r2, 50
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
