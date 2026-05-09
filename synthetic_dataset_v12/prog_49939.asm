; DESCRIPTION: Places a magenta 98x29 rectangle at position (305, 210).
; PLAN: r0=305(x), r1=210(y), r2=98(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 210
LDI r2, 98
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
