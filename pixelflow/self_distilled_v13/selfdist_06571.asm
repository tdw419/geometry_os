; DESCRIPTION: Places a magenta 75x105 box at position (294, 161).
; PLAN: r0=294(x), r1=161(y), r2=75(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 161
LDI r2, 75
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
