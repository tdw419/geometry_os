; DESCRIPTION: Renders a magenta box of size 48x79 starting at (187, 27).
; PLAN: r0=187(x), r1=27(y), r2=48(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 27
LDI r2, 48
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
