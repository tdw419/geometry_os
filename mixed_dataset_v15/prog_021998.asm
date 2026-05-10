; DESCRIPTION: Renders a magenta box of size 99x115 starting at (368, 68).
; PLAN: r0=368(x), r1=68(y), r2=99(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 68
LDI r2, 99
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
