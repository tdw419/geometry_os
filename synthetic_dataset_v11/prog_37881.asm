; DESCRIPTION: Places a red 111x13 rectangle at position (115, 169).
; PLAN: r0=115(x), r1=169(y), r2=111(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 169
LDI r2, 111
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
