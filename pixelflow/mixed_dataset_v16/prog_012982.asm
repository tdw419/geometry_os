; DESCRIPTION: Places a magenta 61x36 rectangle at position (243, 55).
; PLAN: r0=243(x), r1=55(y), r2=61(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 55
LDI r2, 61
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
