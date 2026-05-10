; DESCRIPTION: Renders a magenta box of size 66x77 starting at (415, 132).
; PLAN: r0=415(x), r1=132(y), r2=66(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 132
LDI r2, 66
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
