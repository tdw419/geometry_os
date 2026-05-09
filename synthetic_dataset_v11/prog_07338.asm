; DESCRIPTION: Creates a yellow rectangular region at (27, 221) spanning 88 by 18 pixels.
; PLAN: r0=27(x), r1=221(y), r2=88(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 221
LDI r2, 88
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
