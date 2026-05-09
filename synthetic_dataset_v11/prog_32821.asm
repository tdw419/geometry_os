; DESCRIPTION: Renders a magenta box of size 91x80 starting at (161, 146).
; PLAN: r0=161(x), r1=146(y), r2=91(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 146
LDI r2, 91
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
