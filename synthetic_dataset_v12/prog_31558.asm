; DESCRIPTION: Renders a magenta box of size 95x23 starting at (226, 174).
; PLAN: r0=226(x), r1=174(y), r2=95(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 174
LDI r2, 95
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
