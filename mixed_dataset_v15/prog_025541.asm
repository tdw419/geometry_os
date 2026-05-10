; DESCRIPTION: Places a orange 36x48 rectangle at position (15, 174).
; PLAN: r0=15(x), r1=174(y), r2=36(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 174
LDI r2, 36
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
