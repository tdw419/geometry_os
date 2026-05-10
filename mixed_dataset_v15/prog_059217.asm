; DESCRIPTION: Places a red 50x91 box at position (18, 183).
; PLAN: r0=18(x), r1=183(y), r2=50(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 183
LDI r2, 50
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
