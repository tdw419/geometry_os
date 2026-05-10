; DESCRIPTION: Creates a orange filled rectangle of size 25x85 starting at (111, 167).
; PLAN: r0=111(x), r1=167(y), r2=25(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 167
LDI r2, 25
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
