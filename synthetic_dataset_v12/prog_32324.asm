; DESCRIPTION: Renders a orange box of size 48x115 starting at (377, 27).
; PLAN: r0=377(x), r1=27(y), r2=48(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 27
LDI r2, 48
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
