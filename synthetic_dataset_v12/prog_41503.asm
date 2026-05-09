; DESCRIPTION: Renders a red box of size 91x20 starting at (253, 174).
; PLAN: r0=253(x), r1=174(y), r2=91(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 174
LDI r2, 91
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
