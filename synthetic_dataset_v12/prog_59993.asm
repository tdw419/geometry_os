; DESCRIPTION: Renders a orange box of size 120x34 starting at (333, 0).
; PLAN: r0=333(x), r1=0(y), r2=120(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 0
LDI r2, 120
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
