; DESCRIPTION: Places a orange 36x17 rectangle at position (71, 166).
; PLAN: r0=71(x), r1=166(y), r2=36(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 166
LDI r2, 36
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
