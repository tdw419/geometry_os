; DESCRIPTION: Places a orange 85x72 box at position (92, 47).
; PLAN: r0=92(x), r1=47(y), r2=85(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 47
LDI r2, 85
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
