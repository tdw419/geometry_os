; DESCRIPTION: Places a red 77x77 rectangle at position (130, 103).
; PLAN: r0=130(x), r1=103(y), r2=77(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 103
LDI r2, 77
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
