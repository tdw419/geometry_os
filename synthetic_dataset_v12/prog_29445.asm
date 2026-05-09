; DESCRIPTION: Creates a orange rectangular region at (213, 111) spanning 58 by 39 pixels.
; PLAN: r0=213(x), r1=111(y), r2=58(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 111
LDI r2, 58
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
