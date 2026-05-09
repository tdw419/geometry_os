; DESCRIPTION: Renders a orange box of size 92x106 starting at (368, 134).
; PLAN: r0=368(x), r1=134(y), r2=92(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 134
LDI r2, 92
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
