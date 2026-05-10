; DESCRIPTION: Places a orange 96x36 rectangle at position (384, 21).
; PLAN: r0=384(x), r1=21(y), r2=96(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 21
LDI r2, 96
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
