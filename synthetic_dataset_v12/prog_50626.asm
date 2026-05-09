; DESCRIPTION: Renders a orange box of size 79x30 starting at (60, 167).
; PLAN: r0=60(x), r1=167(y), r2=79(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 167
LDI r2, 79
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
