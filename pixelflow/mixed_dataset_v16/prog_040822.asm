; DESCRIPTION: Renders a magenta box of size 28x25 starting at (174, 176).
; PLAN: r0=174(x), r1=176(y), r2=28(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 176
LDI r2, 28
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
