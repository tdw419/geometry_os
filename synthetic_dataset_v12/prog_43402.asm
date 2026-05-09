; DESCRIPTION: Places a red 40x91 rectangle at position (268, 149).
; PLAN: r0=268(x), r1=149(y), r2=40(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 149
LDI r2, 40
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
