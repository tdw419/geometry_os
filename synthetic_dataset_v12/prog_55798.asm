; DESCRIPTION: Places a red 120x50 rectangle at position (207, 191).
; PLAN: r0=207(x), r1=191(y), r2=120(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 191
LDI r2, 120
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
