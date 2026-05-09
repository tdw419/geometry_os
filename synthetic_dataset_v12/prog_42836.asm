; DESCRIPTION: Places a orange 103x50 rectangle at position (271, 178).
; PLAN: r0=271(x), r1=178(y), r2=103(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 178
LDI r2, 103
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
