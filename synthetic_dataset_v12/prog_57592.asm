; DESCRIPTION: Renders a orange box of size 72x115 starting at (94, 8).
; PLAN: r0=94(x), r1=8(y), r2=72(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 8
LDI r2, 72
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
