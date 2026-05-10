; DESCRIPTION: Places a orange 68x28 rectangle at position (291, 111).
; PLAN: r0=291(x), r1=111(y), r2=68(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 111
LDI r2, 68
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
