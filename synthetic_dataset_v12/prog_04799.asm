; DESCRIPTION: Creates a orange rectangular region at (284, 19) spanning 32 by 105 pixels.
; PLAN: r0=284(x), r1=19(y), r2=32(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 19
LDI r2, 32
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
