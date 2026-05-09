; DESCRIPTION: Creates a orange rectangular region at (437, 164) spanning 57 by 64 pixels.
; PLAN: r0=437(x), r1=164(y), r2=57(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 164
LDI r2, 57
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
