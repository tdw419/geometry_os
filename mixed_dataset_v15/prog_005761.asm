; DESCRIPTION: Renders a magenta box of size 97x55 starting at (308, 164).
; PLAN: r0=308(x), r1=164(y), r2=97(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 164
LDI r2, 97
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
