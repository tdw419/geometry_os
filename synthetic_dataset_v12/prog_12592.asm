; DESCRIPTION: Places a orange 12x68 rectangle at position (294, 15).
; PLAN: r0=294(x), r1=15(y), r2=12(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 15
LDI r2, 12
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
