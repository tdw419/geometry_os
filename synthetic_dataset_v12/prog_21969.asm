; DESCRIPTION: Creates a orange rectangular region at (362, 179) spanning 76 by 66 pixels.
; PLAN: r0=362(x), r1=179(y), r2=76(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 179
LDI r2, 76
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
