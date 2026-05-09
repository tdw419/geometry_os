; DESCRIPTION: Creates a yellow rectangular region at (22, 228) spanning 28 by 17 pixels.
; PLAN: r0=22(x), r1=228(y), r2=28(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 228
LDI r2, 28
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
