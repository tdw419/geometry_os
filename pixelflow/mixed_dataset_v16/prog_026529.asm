; DESCRIPTION: Renders a magenta box of size 26x65 starting at (16, 146).
; PLAN: r0=16(x), r1=146(y), r2=26(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 146
LDI r2, 26
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
