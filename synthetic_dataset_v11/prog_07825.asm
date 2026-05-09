; DESCRIPTION: Places a red 65x72 rectangle at position (2, 27).
; PLAN: r0=2(x), r1=27(y), r2=65(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 27
LDI r2, 65
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
