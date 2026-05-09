; DESCRIPTION: Places a orange 15x82 rectangle at position (401, 174).
; PLAN: r0=401(x), r1=174(y), r2=15(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 174
LDI r2, 15
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
