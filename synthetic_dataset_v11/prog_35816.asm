; DESCRIPTION: Places a red 30x63 rectangle at position (65, 103).
; PLAN: r0=65(x), r1=103(y), r2=30(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 103
LDI r2, 30
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
