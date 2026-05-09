; DESCRIPTION: Creates a orange rectangular region at (71, 197) spanning 39 by 52 pixels.
; PLAN: r0=71(x), r1=197(y), r2=39(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 197
LDI r2, 39
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
