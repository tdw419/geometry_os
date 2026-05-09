; DESCRIPTION: Places a red 68x82 rectangle at position (166, 28).
; PLAN: r0=166(x), r1=28(y), r2=68(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 28
LDI r2, 68
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
