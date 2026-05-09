; DESCRIPTION: Places a magenta 120x91 rectangle at position (106, 76).
; PLAN: r0=106(x), r1=76(y), r2=120(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 76
LDI r2, 120
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
