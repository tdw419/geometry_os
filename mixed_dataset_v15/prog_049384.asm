; DESCRIPTION: Renders a magenta box of size 84x48 starting at (415, 200).
; PLAN: r0=415(x), r1=200(y), r2=84(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 200
LDI r2, 84
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
