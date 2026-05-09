; DESCRIPTION: Creates a orange rectangular region at (411, 16) spanning 75 by 64 pixels.
; PLAN: r0=411(x), r1=16(y), r2=75(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 16
LDI r2, 75
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
