; DESCRIPTION: Creates a orange rectangular region at (120, 196) spanning 52 by 19 pixels.
; PLAN: r0=120(x), r1=196(y), r2=52(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 196
LDI r2, 52
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
