; DESCRIPTION: Renders a orange rectangular region spanning 40 by 64 at (178, 166).
; PLAN: r0=178(x), r1=166(y), r2=40(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 166
LDI r2, 40
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
