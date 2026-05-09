; DESCRIPTION: Places a orange 55x82 rectangle at position (442, 90).
; PLAN: r0=442(x), r1=90(y), r2=55(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 90
LDI r2, 55
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
