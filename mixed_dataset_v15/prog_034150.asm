; DESCRIPTION: Renders a magenta box of size 56x15 starting at (178, 187).
; PLAN: r0=178(x), r1=187(y), r2=56(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 187
LDI r2, 56
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
