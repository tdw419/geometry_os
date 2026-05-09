; DESCRIPTION: Renders a orange box of size 70x57 starting at (408, 60).
; PLAN: r0=408(x), r1=60(y), r2=70(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 60
LDI r2, 70
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
