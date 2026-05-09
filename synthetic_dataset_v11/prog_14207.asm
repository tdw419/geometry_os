; DESCRIPTION: Places a magenta 25x47 rectangle at position (125, 46).
; PLAN: r0=125(x), r1=46(y), r2=25(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 46
LDI r2, 25
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
