; DESCRIPTION: Renders a orange box of size 95x46 starting at (92, 200).
; PLAN: r0=92(x), r1=200(y), r2=95(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 200
LDI r2, 95
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
