; DESCRIPTION: Renders a orange box of size 94x115 starting at (85, 139).
; PLAN: r0=85(x), r1=139(y), r2=94(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 139
LDI r2, 94
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
