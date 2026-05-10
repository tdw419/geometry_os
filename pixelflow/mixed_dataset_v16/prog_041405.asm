; DESCRIPTION: Renders a red box of size 55x76 starting at (428, 173).
; PLAN: r0=428(x), r1=173(y), r2=55(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 173
LDI r2, 55
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
