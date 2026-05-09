; DESCRIPTION: Creates a orange rectangular region at (64, 209) spanning 109 by 32 pixels.
; PLAN: r0=64(x), r1=209(y), r2=109(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 209
LDI r2, 109
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
