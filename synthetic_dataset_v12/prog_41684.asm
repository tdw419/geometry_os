; DESCRIPTION: Places a red 98x67 rectangle at position (24, 169).
; PLAN: r0=24(x), r1=169(y), r2=98(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 169
LDI r2, 98
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
