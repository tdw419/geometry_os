; DESCRIPTION: Renders a magenta box of size 95x68 starting at (202, 17).
; PLAN: r0=202(x), r1=17(y), r2=95(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 17
LDI r2, 95
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
