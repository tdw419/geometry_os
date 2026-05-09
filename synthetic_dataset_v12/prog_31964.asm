; DESCRIPTION: Creates a orange rectangular region at (466, 197) spanning 36 by 28 pixels.
; PLAN: r0=466(x), r1=197(y), r2=36(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 197
LDI r2, 36
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
