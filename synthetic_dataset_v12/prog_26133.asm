; DESCRIPTION: Places a orange 18x90 rectangle at position (380, 12).
; PLAN: r0=380(x), r1=12(y), r2=18(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 12
LDI r2, 18
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
