; DESCRIPTION: Renders a red box of size 85x12 starting at (160, 174).
; PLAN: r0=160(x), r1=174(y), r2=85(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 174
LDI r2, 85
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
