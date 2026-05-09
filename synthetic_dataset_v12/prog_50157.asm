; DESCRIPTION: Places a orange 34x24 rectangle at position (292, 169).
; PLAN: r0=292(x), r1=169(y), r2=34(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 169
LDI r2, 34
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
