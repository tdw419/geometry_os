; DESCRIPTION: Places a magenta 106x113 box at position (41, 180).
; PLAN: r0=41(x), r1=180(y), r2=106(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 180
LDI r2, 106
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
