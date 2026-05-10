; DESCRIPTION: Places a magenta 107x62 rectangle at position (399, 174).
; PLAN: r0=399(x), r1=174(y), r2=107(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 174
LDI r2, 107
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
