; DESCRIPTION: Renders a red box of size 68x21 starting at (207, 232).
; PLAN: r0=207(x), r1=232(y), r2=68(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 232
LDI r2, 68
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
