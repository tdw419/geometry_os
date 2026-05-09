; DESCRIPTION: Renders a magenta box of size 89x27 starting at (10, 146).
; PLAN: r0=10(x), r1=146(y), r2=89(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 146
LDI r2, 89
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
