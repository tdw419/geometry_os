; DESCRIPTION: Places a red 34x23 rectangle at position (262, 169).
; PLAN: r0=262(x), r1=169(y), r2=34(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 169
LDI r2, 34
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
