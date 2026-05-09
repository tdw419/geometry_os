; DESCRIPTION: Renders a magenta box of size 65x16 starting at (123, 91).
; PLAN: r0=123(x), r1=91(y), r2=65(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 91
LDI r2, 65
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
