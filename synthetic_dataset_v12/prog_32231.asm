; DESCRIPTION: Creates a orange rectangular region at (92, 143) spanning 90 by 63 pixels.
; PLAN: r0=92(x), r1=143(y), r2=90(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 143
LDI r2, 90
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
