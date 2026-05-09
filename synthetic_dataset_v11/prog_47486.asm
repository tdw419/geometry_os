; DESCRIPTION: Places a orange 34x72 rectangle at position (140, 144).
; PLAN: r0=140(x), r1=144(y), r2=34(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 144
LDI r2, 34
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
