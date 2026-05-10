; DESCRIPTION: Places a red 56x98 rectangle at position (40, 103).
; PLAN: r0=40(x), r1=103(y), r2=56(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 103
LDI r2, 56
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
