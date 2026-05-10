; DESCRIPTION: Places a red 82x91 rectangle at position (231, 11).
; PLAN: r0=231(x), r1=11(y), r2=82(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 11
LDI r2, 82
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
