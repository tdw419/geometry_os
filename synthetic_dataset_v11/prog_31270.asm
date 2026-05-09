; DESCRIPTION: Renders a red box of size 69x84 starting at (130, 146).
; PLAN: r0=130(x), r1=146(y), r2=69(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 146
LDI r2, 69
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
