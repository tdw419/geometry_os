; DESCRIPTION: Places a orange 33x11 rectangle at position (292, 174).
; PLAN: r0=292(x), r1=174(y), r2=33(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 174
LDI r2, 33
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
