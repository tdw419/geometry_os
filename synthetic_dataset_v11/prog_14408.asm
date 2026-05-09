; DESCRIPTION: Renders a magenta box of size 16x27 starting at (213, 65).
; PLAN: r0=213(x), r1=65(y), r2=16(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 65
LDI r2, 16
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
