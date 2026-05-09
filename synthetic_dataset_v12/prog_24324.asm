; DESCRIPTION: Places a orange 72x109 rectangle at position (358, 92).
; PLAN: r0=358(x), r1=92(y), r2=72(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 92
LDI r2, 72
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
