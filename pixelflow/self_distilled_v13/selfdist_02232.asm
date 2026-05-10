; DESCRIPTION: Creates a orange filled rectangle of size 95x82 starting at (164, 57).
; PLAN: r0=164(x), r1=57(y), r2=95(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 57
LDI r2, 95
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
