; DESCRIPTION: Creates a orange rectangular region at (284, 11) spanning 50 by 112 pixels.
; PLAN: r0=284(x), r1=11(y), r2=50(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 11
LDI r2, 50
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
