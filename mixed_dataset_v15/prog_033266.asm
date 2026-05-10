; DESCRIPTION: Places a red 48x102 rectangle at position (273, 73).
; PLAN: r0=273(x), r1=73(y), r2=48(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 73
LDI r2, 48
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
