; DESCRIPTION: Renders a magenta box of size 83x16 starting at (173, 44).
; PLAN: r0=173(x), r1=44(y), r2=83(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 44
LDI r2, 83
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
