; DESCRIPTION: Renders a magenta box of size 47x27 starting at (149, 226).
; PLAN: r0=149(x), r1=226(y), r2=47(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 226
LDI r2, 47
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
