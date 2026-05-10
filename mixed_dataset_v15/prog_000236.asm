; DESCRIPTION: Creates a orange filled rectangle of size 104x46 starting at (137, 27).
; PLAN: r0=137(x), r1=27(y), r2=104(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 27
LDI r2, 104
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
