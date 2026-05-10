; DESCRIPTION: Creates a orange filled rectangle of size 104x13 starting at (217, 187).
; PLAN: r0=217(x), r1=187(y), r2=104(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 187
LDI r2, 104
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
