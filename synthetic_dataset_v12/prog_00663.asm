; DESCRIPTION: Renders a red box of size 14x33 starting at (69, 146).
; PLAN: r0=69(x), r1=146(y), r2=14(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 146
LDI r2, 14
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
