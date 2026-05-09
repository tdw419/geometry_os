; DESCRIPTION: Renders a orange box of size 32x115 starting at (27, 119).
; PLAN: r0=27(x), r1=119(y), r2=32(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 119
LDI r2, 32
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
