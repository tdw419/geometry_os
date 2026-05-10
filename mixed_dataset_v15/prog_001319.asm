; DESCRIPTION: Places a magenta 98x43 rectangle at position (243, 180).
; PLAN: r0=243(x), r1=180(y), r2=98(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 180
LDI r2, 98
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
