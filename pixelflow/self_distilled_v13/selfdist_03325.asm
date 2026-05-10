; DESCRIPTION: Places a orange 48x28 box at position (380, 100).
; PLAN: r0=380(x), r1=100(y), r2=48(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 100
LDI r2, 48
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
