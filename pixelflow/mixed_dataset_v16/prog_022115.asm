; DESCRIPTION: Places a yellow 56x82 rectangle at position (376, 102).
; PLAN: r0=376(x), r1=102(y), r2=56(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 102
LDI r2, 56
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
