; DESCRIPTION: Places a green 120x85 rectangle at position (113, 156).
; PLAN: r0=113(x), r1=156(y), r2=120(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 156
LDI r2, 120
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
