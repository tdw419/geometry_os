; DESCRIPTION: Creates a orange filled rectangle of size 63x104 starting at (86, 197).
; PLAN: r0=86(x), r1=197(y), r2=63(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 197
LDI r2, 63
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
