; DESCRIPTION: Places a red 34x99 rectangle at position (127, 71).
; PLAN: r0=127(x), r1=71(y), r2=34(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 71
LDI r2, 34
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
