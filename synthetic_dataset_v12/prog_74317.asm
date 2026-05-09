; DESCRIPTION: Renders a magenta box of size 48x16 starting at (77, 171).
; PLAN: r0=77(x), r1=171(y), r2=48(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 171
LDI r2, 48
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
